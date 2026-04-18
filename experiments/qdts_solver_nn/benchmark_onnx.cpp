/**
 * benchmark_onnx.cpp
 *
 * Benchmarks inference time across all exported ONNX models.
 * For every (N, variant) combination it runs NUM_INPUTS random inputs,
 * measures wall-clock time per call, and writes a summary to a text file.
 *
 * Usage (compiled by build_and_run_benchmark.sh):
 *   ./benchmark_onnx <onnx_dir> <output_file> [num_inputs]
 *
 * Output columns (per variant row):
 *   N  variant  mean_ms  std_ms  min_ms  p50_ms  p95_ms  p99_ms  max_ms
 */

#include <onnxruntime_cxx_api.h>

#include <algorithm>
#include <chrono>
#include <cmath>
#include <cstdint>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <random>
#include <string>
#include <vector>

// ── constants ────────────────────────────────────────────────────────────────
static constexpr int N_MIN         = 5;
static constexpr int N_MAX         = 16;
static constexpr int NUM_VARIANTS  = 16;
static constexpr int DEFAULT_RUNS  = 100;

// ── statistics ───────────────────────────────────────────────────────────────
struct Stats {
    double mean, std, min, p50, p95, p99, max;
};

static Stats computeStats(std::vector<double> v) {
    std::sort(v.begin(), v.end());
    const size_t n = v.size();

    double sum = std::accumulate(v.begin(), v.end(), 0.0);
    double mean = sum / n;

    double sq = 0;
    for (double x : v) sq += (x - mean) * (x - mean);

    auto pct = [&](double p) -> double {
        size_t i = static_cast<size_t>(std::ceil(p * n)) - 1;
        return v[std::min(i, n - 1)];
    };

    return {mean, std::sqrt(sq / n), v.front(),
            pct(0.50), pct(0.95), pct(0.99), v.back()};
}

// ── helpers ──────────────────────────────────────────────────────────────────
static std::string modelPath(const std::string& dir, int n) {
    return dir + "/qdts_solver_N" + std::to_string(n) + ".onnx";
}

static std::vector<float> randomInput(int n, std::mt19937& rng) {
    std::uniform_real_distribution<float> dist(0.01f, 1.0f);
    std::vector<float> v(n);
    for (auto& x : v) x = dist(rng);
    return v;
}

// ── main ─────────────────────────────────────────────────────────────────────
int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0]
                  << " <onnx_dir> <output_file> [num_inputs]\n";
        return 1;
    }

    const std::string onnx_dir   = argv[1];
    const std::string out_path   = argv[2];
    const int         num_inputs = (argc >= 4) ? std::stoi(argv[3]) : DEFAULT_RUNS;

    std::mt19937 rng(42);

    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "qdts_bench");
    Ort::SessionOptions sess_opts;
    sess_opts.SetIntraOpNumThreads(1);          // single-threaded for fair timing
    sess_opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);

    auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

    const char* in_names[]  = {"T", "variant_index"};
    const char* out_names[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};

    // Accumulate per-N times for the summary row
    std::vector<std::vector<double>> per_n_times(N_MAX - N_MIN + 1);

    // Per-variant result rows
    struct Row {
        int n, variant;
        Stats s;
    };
    std::vector<Row> rows;

    for (int n = N_MIN; n <= N_MAX; ++n) {
        std::string path = modelPath(onnx_dir, n);
        std::cout << "Loading N=" << n << "  (" << path << ") ... " << std::flush;

        Ort::Session session(env, path.c_str(), sess_opts);
        std::cout << "ok\n";

        int64_t n64   = static_cast<int64_t>(n);
        std::array<int64_t, 2> T_shape  = {1, n64};
        // variant_index must be a 0-dim (scalar) tensor so that Gather returns
        // shape (2,H,H) rather than (1,2,H,H) — empty shape array signals scalar.
        std::array<int64_t, 0> vi_shape = {};

        for (int vi = 0; vi < NUM_VARIANTS; ++vi) {
            std::vector<double> times;
            times.reserve(num_inputs);

            for (int run = 0; run < num_inputs; ++run) {
                auto T_data = randomInput(n, rng);
                int64_t vi64 = static_cast<int64_t>(vi);

                std::vector<Ort::Value> inputs;
                inputs.push_back(Ort::Value::CreateTensor<float>(
                    mem, T_data.data(), T_data.size(),
                    T_shape.data(), T_shape.size()));
                inputs.push_back(Ort::Value::CreateTensor<int64_t>(
                    mem, &vi64, 1, vi_shape.data(), vi_shape.size()));

                auto t0 = std::chrono::high_resolution_clock::now();
                auto outputs = session.Run(
                    Ort::RunOptions{}, in_names, inputs.data(), 2, out_names, 4);
                auto t1 = std::chrono::high_resolution_clock::now();

                double ms = std::chrono::duration<double, std::milli>(t1 - t0).count();
                times.push_back(ms);
                per_n_times[n - N_MIN].push_back(ms);
            }

            rows.push_back({n, vi, computeStats(times)});
            std::cout << "  variant " << std::setw(2) << vi
                      << "  mean=" << std::fixed << std::setprecision(3)
                      << rows.back().s.mean << " ms\n";
        }
    }

    // ── write output ─────────────────────────────────────────────────────────
    std::ofstream f(out_path);
    if (!f) { std::cerr << "Cannot open " << out_path << "\n"; return 1; }

    auto sep  = [&]() { f << std::string(90, '-') << "\n"; };
    auto hdr  = [&](const std::string& s) { f << "\n" << s << "\n"; sep(); };

    f << "QDTS ONNX Inference Benchmark\n";
    f << "inputs per variant : " << num_inputs << "\n";
    f << "variants per N     : " << NUM_VARIANTS << "\n";
    f << "N range            : " << N_MIN << " – " << N_MAX << "\n";
    f << "\n";

    // ── per-variant table ────────────────────────────────────────────────────
    hdr("Per-variant results (all times in ms)");
    f << std::left
      << std::setw(5)  << "N"
      << std::setw(10) << "variant"
      << std::setw(10) << "mean"
      << std::setw(10) << "std"
      << std::setw(10) << "min"
      << std::setw(10) << "p50"
      << std::setw(10) << "p95"
      << std::setw(10) << "p99"
      << std::setw(10) << "max"
      << "\n";
    sep();
    f << std::fixed << std::setprecision(4);
    for (auto& r : rows) {
        f << std::left
          << std::setw(5)  << r.n
          << std::setw(10) << r.variant
          << std::setw(10) << r.s.mean
          << std::setw(10) << r.s.std
          << std::setw(10) << r.s.min
          << std::setw(10) << r.s.p50
          << std::setw(10) << r.s.p95
          << std::setw(10) << r.s.p99
          << std::setw(10) << r.s.max
          << "\n";
    }

    // ── per-N summary ────────────────────────────────────────────────────────
    hdr("Per-N summary  (aggregated over all variants and inputs)");
    f << std::left
      << std::setw(5)  << "N"
      << std::setw(10) << "mean"
      << std::setw(10) << "std"
      << std::setw(10) << "min"
      << std::setw(10) << "p50"
      << std::setw(10) << "p95"
      << std::setw(10) << "p99"
      << std::setw(10) << "max"
      << "\n";
    sep();
    f << std::fixed << std::setprecision(4);
    for (int n = N_MIN; n <= N_MAX; ++n) {
        auto s = computeStats(per_n_times[n - N_MIN]);
        f << std::left
          << std::setw(5)  << n
          << std::setw(10) << s.mean
          << std::setw(10) << s.std
          << std::setw(10) << s.min
          << std::setw(10) << s.p50
          << std::setw(10) << s.p95
          << std::setw(10) << s.p99
          << std::setw(10) << s.max
          << "\n";
    }

    f.close();
    std::cout << "\nResults written to: " << out_path << "\n";
    return 0;
}
