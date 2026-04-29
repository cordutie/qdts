/**
 * benchmark_quality.cpp  —  max/source/benchmarks/
 *
 * Generation quality benchmark for qdts.solver_nn.
 * For each N in [5, 16]:
 *   - generates NUM_INPUTS random target amplitude vectors from [0, 1]
 *   - runs all 16 model variants on every input
 *   - records the clamped reconstruction error (MSE) from each inference call
 *   - computes mean, std, min, max across all variants and inputs
 *
 * Results are written to:
 *   <output_base>.txt   – human-readable table
 *   <output_base>.csv   – per-N stats, used by the plotting script
 *   <output_base>.tex   – LaTeX table
 *
 * Build and run via the shell script in this folder:
 *   ./build_and_run_quality.sh
 *
 * Or run directly:
 *   ./benchmark_quality <onnx_dir> <output_base> [num_inputs]
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
static constexpr int N_MIN        = 5;
static constexpr int N_MAX        = 16;
static constexpr int NUM_VARIANTS = 16;
static constexpr int DEFAULT_RUNS = 10000;

// ── statistics ────────────────────────────────────────────────────────────────
struct Stats { double mean, std_dev, min, max; };

static Stats computeStats(const std::vector<double>& v) {
    const double n = static_cast<double>(v.size());
    double mean = std::accumulate(v.begin(), v.end(), 0.0) / n;
    double sq = 0;
    for (double x : v) sq += (x - mean) * (x - mean);
    return {
        mean,
        std::sqrt(sq / n),
        *std::min_element(v.begin(), v.end()),
        *std::max_element(v.begin(), v.end())
    };
}

// ── helpers ───────────────────────────────────────────────────────────────────
static std::string modelPath(const std::string& dir, int n) {
    return dir + "/qdts_solver_N" + std::to_string(n) + ".onnx";
}

static std::vector<float> randomInput(int n, std::mt19937& rng) {
    std::uniform_real_distribution<float> dist(0.0f, 1.0f);
    std::vector<float> v(static_cast<size_t>(n));
    for (auto& x : v) x = dist(rng);
    return v;
}

// ── per-N result bundle ───────────────────────────────────────────────────────
struct NResult { int n; Stats s; };

// ── main ──────────────────────────────────────────────────────────────────────
int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cerr << "Usage: " << argv[0]
                  << " <onnx_dir> <output_base> [num_inputs]\n";
        return 1;
    }

    const std::string onnx_dir   = argv[1];
    const std::string out_base   = argv[2];
    const int         num_inputs = (argc >= 4) ? std::stoi(argv[3]) : DEFAULT_RUNS;

    // ── ONNX setup ────────────────────────────────────────────────────────────
    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "qdts_quality");
    Ort::SessionOptions sess_opts;
    sess_opts.SetIntraOpNumThreads(1);
    sess_opts.SetInterOpNumThreads(1);
    sess_opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
    auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

    const char* in_names[]  = {"T", "variant_index"};
    const char* out_names[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};

    std::vector<NResult> results;
    std::vector<double>  all_errors;

    for (int n = N_MIN; n <= N_MAX; ++n) {
        std::cout << "── N=" << n << " ────────────────────────────────\n";

        std::mt19937 rng(42 + static_cast<unsigned>(n));
        std::vector<std::vector<float>> inputs;
        inputs.reserve(static_cast<size_t>(num_inputs));
        for (int i = 0; i < num_inputs; ++i)
            inputs.push_back(randomInput(n, rng));

        std::string path = modelPath(onnx_dir, n);
        std::cout << "  Loading " << path << " ... " << std::flush;
        Ort::Session session(env, path.c_str(), sess_opts);
        std::cout << "ok\n";

        int64_t n64 = static_cast<int64_t>(n);
        std::array<int64_t, 2> T_shape  = {1, n64};
        std::array<int64_t, 0> vi_shape = {};

        std::vector<double> errors;
        errors.reserve(static_cast<size_t>(NUM_VARIANTS * num_inputs));

        for (int vi = 0; vi < NUM_VARIANTS; ++vi) {
            for (const auto& inp : inputs) {
                std::vector<float> T_buf(inp);
                int64_t vi64 = static_cast<int64_t>(vi);

                std::vector<Ort::Value> ort_inputs;
                ort_inputs.push_back(Ort::Value::CreateTensor<float>(
                    mem, T_buf.data(), T_buf.size(),
                    T_shape.data(), T_shape.size()));
                ort_inputs.push_back(Ort::Value::CreateTensor<int64_t>(
                    mem, &vi64, 1,
                    vi_shape.data(), vi_shape.size()));

                auto outs = session.Run(
                    Ort::RunOptions{},
                    in_names, ort_inputs.data(), 2,
                    out_names, 4);

                // index 3 = error_clamped (default clamp=true behaviour)
                float err = *outs[3].GetTensorData<float>();
                errors.push_back(static_cast<double>(err));
            }

            // per-variant progress
            size_t start = static_cast<size_t>(vi) * static_cast<size_t>(num_inputs);
            double vi_mean = 0;
            for (size_t k = start; k < start + static_cast<size_t>(num_inputs); ++k)
                vi_mean += errors[k];
            vi_mean /= static_cast<double>(num_inputs);
            std::cout << "    variant " << std::setw(2) << vi
                      << "  mean error=" << std::fixed << std::setprecision(6)
                      << vi_mean << "\n";
        }

        all_errors.insert(all_errors.end(), errors.begin(), errors.end());
        results.push_back({n, computeStats(errors)});
    }

    Stats overall = computeStats(all_errors);

    // ── text output ───────────────────────────────────────────────────────────
    std::string txt_path = out_base + ".txt";
    std::ofstream f(txt_path);
    if (!f) { std::cerr << "Cannot open " << txt_path << "\n"; return 1; }

    auto hr = [&]() { f << std::string(72, '-') << "\n"; };

    f << "QDTS solver_nn Generation Quality Benchmark\n";
    f << "inputs per N      : " << num_inputs << "\n";
    f << "variants          : " << NUM_VARIANTS << "\n";
    f << "total per N       : " << num_inputs * NUM_VARIANTS << "\n";
    f << "N range           : " << N_MIN << " – " << N_MAX << "\n";
    f << "error metric      : clamped reconstruction MSE\n\n";

    f << std::left
      << std::setw(5)  << "N"
      << std::setw(16) << "mean error"
      << std::setw(16) << "std error"
      << std::setw(16) << "min error"
      << std::setw(16) << "max error"
      << "\n";
    hr();
    f << std::fixed << std::setprecision(6);
    for (auto& r : results)
        f << std::left
          << std::setw(5)  << r.n
          << std::setw(16) << r.s.mean
          << std::setw(16) << r.s.std_dev
          << std::setw(16) << r.s.min
          << std::setw(16) << r.s.max
          << "\n";
    hr();
    f << std::left
      << std::setw(5)  << "ALL"
      << std::setw(16) << overall.mean
      << std::setw(16) << overall.std_dev
      << std::setw(16) << overall.min
      << std::setw(16) << overall.max
      << "\n";
    f.close();
    std::cout << "\nText results  → " << txt_path << "\n";

    // ── CSV output ────────────────────────────────────────────────────────────
    std::string csv_path = out_base + ".csv";
    std::ofstream c(csv_path);
    if (!c) { std::cerr << "Cannot open " << csv_path << "\n"; return 1; }
    c << "N,mean_error,std_error,min_error,max_error\n";
    c << std::fixed << std::setprecision(8);
    for (auto& r : results)
        c << r.n << ","
          << r.s.mean    << "," << r.s.std_dev << ","
          << r.s.min     << "," << r.s.max
          << "\n";
    c.close();
    std::cout << "CSV results   → " << csv_path << "\n";

    // ── LaTeX output ──────────────────────────────────────────────────────────
    std::string tex_path = out_base + ".tex";
    std::ofstream t(tex_path);
    if (!t) { std::cerr << "Cannot open " << tex_path << "\n"; return 1; }

    // Requires: booktabs, siunitx, multirow
    t << "% Auto-generated by benchmark_quality — do not edit\n"
         "% Required packages: booktabs, siunitx\n";
    t << "\\begin{table}[t]\n"
         "\\centering\n";
    t << "\\caption{Reconstruction error (clamped MSE) of \\texttt{qdts.solver\\_nn}\n"
         "  for target spectra of size~$N$, aggregated over " << num_inputs
      << "~random inputs\n"
         "  (drawn uniformly from $[0,1]$) across all " << NUM_VARIANTS
      << "~model variants.}\n";
    t << "\\label{tab:quality_benchmark}\n";
    t << "\\begin{tabular}{"
         "  c"
         "  S[table-format=1.6] @{\\;$\\pm$\\;} S[table-format=1.6]"
         "  S[table-format=1.6]"
         "  S[table-format=1.6]"
         "}\n";
    t << "\\toprule\n";
    t << "$N$"
         " & \\multicolumn{2}{c}{mean $\\pm$ std}"
         " & {min}"
         " & {max} \\\\\n";
    t << "\\midrule\n";
    t << std::fixed << std::setprecision(6);
    for (auto& r : results)
        t << r.n
          << " & " << r.s.mean << " & " << r.s.std_dev
          << " & " << r.s.min
          << " & " << r.s.max
          << " \\\\\n";
    t << "\\midrule\n";
    t << "\\textbf{Overall}"
      << " & " << overall.mean << " & " << overall.std_dev
      << " & " << overall.min
      << " & " << overall.max
      << " \\\\\n";
    t << "\\bottomrule\n"
         "\\end{tabular}\n"
         "\\end{table}\n";
    t.close();
    std::cout << "LaTeX results → " << tex_path << "\n";

    return 0;
}
