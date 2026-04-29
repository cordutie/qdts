/**
 * benchmark_smoothness.cpp  —  max/source/benchmarks/
 *
 * Smoothness benchmark for qdts.solver_nn.
 *
 * For each N in [5, 16] and each of the 16 model variants:
 *   - generates NUM_PAIRS random endpoint vectors A ~ U[0, 2]^N,  B = 2 - A
 *   - evaluates f(A) and f(B) (carrier outputs at the endpoints)
 *   - interpolates at t = 0, 0.1, ..., 1.0  (11 points, endpoints included)
 *   - for each interior t:
 *       ratio = ‖f(T_t) − f(A)‖ / ‖f(B) − f(A)‖
 *     where ‖·‖ is the Euclidean norm over all N+1 carrier outputs and
 *     T_t = (1-t)*A + t*B.  For a perfectly linear model this equals t.
 *     Pairs where ‖f(B) − f(A)‖ < EPS are skipped.
 *
 * All ratio samples are pooled across N and variants into per-t buckets,
 * then reduced to box-plot statistics.
 * Endpoint buckets (t=0, t=1) are set analytically to 0 / 1.
 *
 * Results are written to:
 *   <output_base>.csv   – per-t stats (mean, std, quartiles, whiskers)
 *   <output_base>.txt   – human-readable table
 *
 * Build and run:
 *   ./build_and_run_smoothness.sh
 */

#include <onnxruntime_cxx_api.h>

#include <algorithm>
#include <cmath>
#include <cstdint>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <random>
#include <string>
#include <vector>

// ── constants ─────────────────────────────────────────────────────────────────
static constexpr int    N_MIN         = 5;
static constexpr int    N_MAX         = 16;
static constexpr int    NUM_VARIANTS  = 16;
static constexpr int    DEFAULT_PAIRS = 1000;
static constexpr int    NUM_T         = 11;   // t = 0.0, 0.1, ..., 1.0
static constexpr double NORM_EPS      = 1e-6; // skip pair if ‖fB-fA‖ < this
static const double     T_VALUES[NUM_T] = {0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0};

// ── statistics ────────────────────────────────────────────────────────────────
struct BoxStats {
    double mean, std_dev, q1, median, q3, whislo, whishi;
};

static BoxStats computeBoxStats(std::vector<double> v) {
    std::sort(v.begin(), v.end());
    const size_t n = v.size();

    double sum = std::accumulate(v.begin(), v.end(), 0.0);
    double mean = sum / static_cast<double>(n);
    double sq = 0;
    for (double x : v) sq += (x - mean) * (x - mean);

    auto pct = [&](double p) -> double {
        double idx = p * static_cast<double>(n - 1);
        size_t lo = static_cast<size_t>(idx);
        size_t hi = std::min(lo + 1, n - 1);
        double f = idx - static_cast<double>(lo);
        return v[lo] * (1.0 - f) + v[hi] * f;
    };

    double q1     = pct(0.25);
    double median = pct(0.50);
    double q3     = pct(0.75);
    double iqr    = q3 - q1;

    double lo_fence = q1 - 1.5 * iqr;
    double hi_fence = q3 + 1.5 * iqr;
    double whislo = q1, whishi = q3;
    for (double x : v)                         { if (x >= lo_fence) { whislo = x; break; } }
    for (auto it = v.rbegin(); it != v.rend(); ++it)
                                               { if (*it <= hi_fence) { whishi = *it; break; } }

    return {mean, std::sqrt(sq / static_cast<double>(n)),
            q1, median, q3, whislo, whishi};
}

// ── helpers ───────────────────────────────────────────────────────────────────
static std::string modelPath(const std::string& dir, int n) {
    return dir + "/qdts_solver_N" + std::to_string(n) + ".onnx";
}

static std::vector<float> infer(
    Ort::Session& session,
    const Ort::MemoryInfo& mem,
    const std::vector<float>& T_data,
    int64_t vi)
{
    const char* in_names[]  = {"T", "variant_index"};
    const char* out_names[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};

    int n = static_cast<int>(T_data.size());
    std::vector<float> buf(T_data);

    std::array<int64_t, 2> T_shape  = {1, static_cast<int64_t>(n)};
    std::array<int64_t, 0> vi_shape = {};

    std::vector<Ort::Value> inputs;
    inputs.push_back(Ort::Value::CreateTensor<float>(
        mem, buf.data(), buf.size(), T_shape.data(), T_shape.size()));
    inputs.push_back(Ort::Value::CreateTensor<int64_t>(
        mem, &vi, 1, vi_shape.data(), vi_shape.size()));

    auto outs = session.Run(
        Ort::RunOptions{}, in_names, inputs.data(), 2, out_names, 4);

    const float* ptr = outs[2].GetTensorData<float>();  // X_hat_clamped
    return std::vector<float>(ptr, ptr + n + 1);
}

// ── main ──────────────────────────────────────────────────────────────────────
int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0]
                  << " <onnx_dir> <output_base> [num_pairs]\n";
        return 1;
    }

    const std::string onnx_dir  = argv[1];
    const std::string out_base  = argv[2];
    const int num_pairs = (argc >= 4) ? std::stoi(argv[3]) : DEFAULT_PAIRS;

    // per-t accumulation (interior points only; endpoints handled analytically)
    std::vector<std::vector<double>> all_vals(NUM_T);

    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "qdts_smooth");
    Ort::SessionOptions sess_opts;
    sess_opts.SetIntraOpNumThreads(1);
    sess_opts.SetInterOpNumThreads(1);
    sess_opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
    auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

    for (int n = N_MIN; n <= N_MAX; ++n) {
        std::cout << "── N=" << n << " ────────────────────────────────\n";

        std::string path = modelPath(onnx_dir, n);
        std::cout << "  Loading " << path << " ... " << std::flush;
        Ort::Session session(env, path.c_str(), sess_opts);
        std::cout << "ok\n";

        std::mt19937 rng(42 + static_cast<unsigned>(n));
        std::uniform_real_distribution<float> dist(0.0f, 2.0f);

        for (int pair = 0; pair < num_pairs; ++pair) {
            std::vector<float> A(static_cast<size_t>(n)), B(static_cast<size_t>(n));
            for (int i = 0; i < n; ++i) {
                A[i] = dist(rng);
                B[i] = 2.0f - A[i];
            }

            for (int vi = 0; vi < NUM_VARIANTS; ++vi) {
                int64_t vi64 = static_cast<int64_t>(vi);

                auto fA = infer(session, mem, A, vi64);
                auto fB = infer(session, mem, B, vi64);

                int out_size = n + 1;

                for (int ti = 0; ti < NUM_T; ++ti) {
                    double t = T_VALUES[ti];

                    // endpoints: normalized value is exactly 0 or 1 by construction
                    if (t == 0.0 || t == 1.0) {
                        double exact = (t == 0.0) ? 0.0 : 1.0;
                        for (int i = 0; i < out_size; ++i)
                            all_vals[ti].push_back(exact);
                        continue;
                    }

                    std::vector<float> T_t(static_cast<size_t>(n));
                    for (int i = 0; i < n; ++i)
                        T_t[i] = static_cast<float>((1.0 - t) * A[i] + t * B[i]);

                    auto fT = infer(session, mem, T_t, vi64);

                    double numer_sq = 0.0, denom_sq = 0.0;
                    for (int i = 0; i < out_size; ++i) {
                        double dn = static_cast<double>(fT[i]) - static_cast<double>(fA[i]);
                        double dd = static_cast<double>(fB[i]) - static_cast<double>(fA[i]);
                        numer_sq += dn * dn;
                        denom_sq += dd * dd;
                    }
                    double denom = std::sqrt(denom_sq / static_cast<double>(out_size));
                    if (denom < NORM_EPS) continue;
                    double ratio = std::sqrt(numer_sq / static_cast<double>(out_size)) / denom;
                    all_vals[ti].push_back(ratio);
                }
            }

            if ((pair + 1) % 100 == 0)
                std::cout << "  pairs: " << (pair + 1) << "/" << num_pairs << "\n";
        }
    }

    // ── compute stats per t ───────────────────────────────────────────────────
    std::vector<BoxStats> stats(NUM_T);
    for (int ti = 0; ti < NUM_T; ++ti)
        stats[ti] = computeBoxStats(all_vals[ti]);

    // ── text output ───────────────────────────────────────────────────────────
    std::string txt_path = out_base + ".txt";
    std::ofstream f(txt_path);
    if (!f) { std::cerr << "Cannot open " << txt_path << "\n"; return 1; }

    f << "QDTS solver_nn Output Smoothness Benchmark\n";
    f << "pairs per N          : " << num_pairs << "\n";
    f << "variants per N       : " << NUM_VARIANTS << "\n";
    f << "t values             : 0.0, 0.1, ..., 1.0\n";
    f << "metric               : normalized output distance\n";
    f << "                       ||f(T_t) - f(A)|| / ||f(B) - f(A)||\n";
    f << "                       ideal value = t\n\n";

    f << std::left
      << std::setw(6)  << "t"
      << std::setw(14) << "mean"
      << std::setw(14) << "std"
      << std::setw(14) << "q1"
      << std::setw(14) << "median"
      << std::setw(14) << "q3"
      << std::setw(14) << "whislo"
      << std::setw(14) << "whishi"
      << "\n";
    f << std::string(90, '-') << "\n";
    f << std::fixed << std::setprecision(6);
    for (int ti = 0; ti < NUM_T; ++ti) {
        const auto& s = stats[ti];
        f << std::left
          << std::setw(6)  << T_VALUES[ti]
          << std::setw(14) << s.mean
          << std::setw(14) << s.std_dev
          << std::setw(14) << s.q1
          << std::setw(14) << s.median
          << std::setw(14) << s.q3
          << std::setw(14) << s.whislo
          << std::setw(14) << s.whishi
          << "\n";
    }
    f.close();
    std::cout << "\nText results → " << txt_path << "\n";

    // ── CSV output ────────────────────────────────────────────────────────────
    std::string csv_path = out_base + ".csv";
    std::ofstream c(csv_path);
    if (!c) { std::cerr << "Cannot open " << csv_path << "\n"; return 1; }
    c << "t,mean_val,std_val,q1_val,median_val,q3_val,whislo_val,whishi_val\n";
    c << std::fixed << std::setprecision(8);
    for (int ti = 0; ti < NUM_T; ++ti) {
        const auto& s = stats[ti];
        c << T_VALUES[ti] << ","
          << s.mean    << "," << s.std_dev << ","
          << s.q1      << "," << s.median  << ","
          << s.q3      << "," << s.whislo  << "," << s.whishi
          << "\n";
    }
    c.close();
    std::cout << "CSV results  → " << csv_path << "\n";

    return 0;
}
