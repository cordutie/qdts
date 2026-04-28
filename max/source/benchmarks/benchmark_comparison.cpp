/**
 * benchmark_comparison.cpp  —  max/source/benchmarks/
 *
 * Head-to-head timing benchmark: qdts.solver (Newton-Raphson) vs. qdts.solver_nn (ONNX).
 *
 * For each N in [5, 16]:
 *   - generates NUM_INPUTS random target amplitude vectors (same seed → same inputs
 *     for both solvers so the comparison is fair)
 *   - runs qdts.solver on every input and records wall-clock time
 *   - runs all 16 qdts.solver_nn variants on every input and records wall-clock time
 *
 * Results are written to:
 *   <output_base>.txt   – human-readable table
 *   <output_base>.tex   – LaTeX table (mean ± std per N, plus an Overall row)
 *
 * Build and run via the shell script in this folder:
 *   ./build_and_run_comparison.sh
 *
 * Or run directly:
 *   ./benchmark_comparison <onnx_dir> <output_base> [num_inputs]
 */

#include <onnxruntime_cxx_api.h>

// Eigen (header-only) – path injected by the build script via -I
#include <Eigen/Dense>

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

// ── constants ─────────────────────────────────────────────────────────────────
static constexpr int N_MIN        = 5;
static constexpr int N_MAX        = 16;
static constexpr int NUM_VARIANTS = 16;
static constexpr int DEFAULT_RUNS = 10000;

// ── statistics ────────────────────────────────────────────────────────────────
struct Stats { double mean, std_dev; };

static Stats computeStats(const std::vector<double>& v) {
    const double n = static_cast<double>(v.size());
    double mean = std::accumulate(v.begin(), v.end(), 0.0) / n;
    double sq = 0;
    for (double x : v) sq += (x - mean) * (x - mean);
    return {mean, std::sqrt(sq / n)};
}

// ── qdts.solver — Newton-Raphson (extracted from roots.solver.cpp) ────────────
namespace qdts_solver {

using V = Eigen::VectorXd;
using M = Eigen::MatrixXd;

static V shift_left(const V& x) {
    int n = static_cast<int>(x.rows());
    V s = V::Zero(n);
    for (int i = 0; i < n - 1; ++i) s(i) = x(i + 1);
    return s;
}

static V shift_left_n(V x, int times) {
    for (int i = 0; i < times; ++i) x = shift_left(x);
    return x;
}

static V shift_right(const V& x) {
    int n = static_cast<int>(x.rows());
    V s = V::Zero(n);
    for (int i = 0; i < n - 1; ++i) s(i + 1) = x(i);
    return s;
}

static V shift_right_n(V x, int times) {
    for (int i = 0; i < times; ++i) x = shift_right(x);
    return x;
}

static V A(const V& x) {
    int n = static_cast<int>(x.rows());
    V y = V::Zero(n + 1);
    y(0) = 1.0;
    for (int i = 0; i < n; ++i) y(i + 1) = x(i);
    V z = V::Zero(n);
    for (int i = 0; i < n; ++i) z(i) = y.dot(shift_left_n(y, i + 1));
    return z;
}

static V F(const V& x, const V& t) { return A(x) - t; }

static M DF(const V& x) {
    int n = static_cast<int>(x.rows());
    M z = M::Zero(n, n);
    for (int i = 0; i < n - 1; ++i) {
        V tmp = shift_left_n(x, i + 1) + shift_right_n(x, i + 1);
        for (int j = 0; j < n; ++j) z(i, j) = tmp(j);
    }
    z += M::Identity(n, n);
    return z;
}

// Returns wall-clock time in milliseconds.
static double solve(const std::vector<float>& target, std::mt19937& rng) {
    const int n = static_cast<int>(target.size());
    V init_T(n), T(n);
    for (int i = 0; i < n; ++i) init_T(i) = T(i) = static_cast<double>(target[i]);

    std::uniform_real_distribution<double> u01(0.0, 1.0);
    auto rand_vec = [&]() -> V {
        V v(n);
        for (int i = 0; i < n; ++i) v(i) = u01(rng);
        return v;
    };

    V X = 0.5 * (rand_vec() + V::Ones(n));
    V best = V::Constant(n, 0.5);
    auto err = [&](const V& x, const V& tgt) { return F(x, tgt).squaredNorm(); };

    auto t0 = std::chrono::high_resolution_clock::now();

    constexpr int tolerance = 33;
    int success = 0, escape = 0, j = 0;
    while (!success && !escape) {
        ++j;
        int i = 0;
        while (err(X, T) > 0.0001 && i < tolerance) {
            ++i;
            X = DF(X).colPivHouseholderQr().solve(DF(X) * X - F(X, T));
        }
        if (err(X, init_T) < err(best, init_T)) best = X;
        if (err(X, T) <= 0.0001)  { success = 1; }
        else if (j > 100)          { escape  = 1; }
        else {
            T = init_T + 0.01 * rand_vec();
            X = 0.5 * (V::Ones(n) + rand_vec());
        }
    }

    if (!success) {
        X = 0.5 * (rand_vec() + V::Ones(n));
        for (int i = 0; i < n; ++i) T(i) = init_T(i);
        j = 0;
        while (!success && j < 100) {
            ++j;
            int i = 0;
            while (err(X, T) > 0.0001 && i < tolerance) {
                ++i;
                X = DF(X).colPivHouseholderQr().solve(DF(X) * X - F(X, T));
            }
            if (err(X, init_T) < err(best, init_T)) best = X;
            if (err(X, T) <= 0.0001) success = 1;
            else {
                T = T + 0.01 * rand_vec();
                X = 0.5 * (V::Ones(n) + rand_vec());
            }
        }
    }

    auto t1 = std::chrono::high_resolution_clock::now();
    return std::chrono::duration<double, std::milli>(t1 - t0).count();
}

} // namespace qdts_solver

// ── helpers ───────────────────────────────────────────────────────────────────
static std::string modelPath(const std::string& dir, int n) {
    return dir + "/qdts_solver_N" + std::to_string(n) + ".onnx";
}

static std::vector<float> randomInput(int n, std::mt19937& rng) {
    std::uniform_real_distribution<float> dist(0.0f, 2.0f);
    std::vector<float> v(static_cast<size_t>(n));
    for (auto& x : v) x = dist(rng);
    return v;
}

// ── per-N result bundle ───────────────────────────────────────────────────────
struct NResult {
    int n;
    Stats solver;     // qdts.solver
    Stats solver_nn;  // qdts.solver_nn (all 16 variants pooled)
};

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
    Ort::Env env(ORT_LOGGING_LEVEL_WARNING, "qdts_bench");
    Ort::SessionOptions sess_opts;
    sess_opts.SetIntraOpNumThreads(1);
    sess_opts.SetInterOpNumThreads(1);
    sess_opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);
    auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

    const char* in_names[]  = {"T", "variant_index"};
    const char* out_names[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};

    std::vector<NResult>  results;
    std::vector<double>   all_solver_times, all_nn_times;

    for (int n = N_MIN; n <= N_MAX; ++n) {
        std::cout << "── N=" << n << " ────────────────────────────────\n";

        // Fixed seed per N so both solvers see identical inputs.
        std::mt19937 rng_inputs(42 + static_cast<unsigned>(n));
        std::vector<std::vector<float>> inputs;
        inputs.reserve(static_cast<size_t>(num_inputs));
        for (int i = 0; i < num_inputs; ++i)
            inputs.push_back(randomInput(n, rng_inputs));

        // ── qdts.solver ───────────────────────────────────────────────────────
        std::cout << "  qdts.solver    ... " << std::flush;
        std::vector<double> solver_times;
        solver_times.reserve(static_cast<size_t>(num_inputs));
        {
            std::mt19937 rng_nr(99 + static_cast<unsigned>(n));
            for (const auto& inp : inputs)
                solver_times.push_back(qdts_solver::solve(inp, rng_nr));
        }
        {
            Stats s = computeStats(solver_times);
            std::cout << "mean=" << std::fixed << std::setprecision(3) << s.mean << " ms\n";
        }
        all_solver_times.insert(all_solver_times.end(), solver_times.begin(), solver_times.end());

        // ── qdts.solver_nn ────────────────────────────────────────────────────
        std::string path = modelPath(onnx_dir, n);
        std::cout << "  qdts.solver_nn loading " << path << " ... " << std::flush;
        Ort::Session session(env, path.c_str(), sess_opts);
        std::cout << "ok\n";

        int64_t n64 = static_cast<int64_t>(n);
        std::array<int64_t, 2> T_shape  = {1, n64};
        std::array<int64_t, 0> vi_shape = {};

        std::vector<double> nn_times;
        nn_times.reserve(static_cast<size_t>(NUM_VARIANTS * num_inputs));

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

                auto t0 = std::chrono::high_resolution_clock::now();
                session.Run(Ort::RunOptions{}, in_names, ort_inputs.data(), 2, out_names, 4);
                auto t1 = std::chrono::high_resolution_clock::now();

                nn_times.push_back(
                    std::chrono::duration<double, std::milli>(t1 - t0).count());
            }
            double vi_mean = 0;
            size_t start = static_cast<size_t>(vi) * static_cast<size_t>(num_inputs);
            for (size_t k = start; k < start + static_cast<size_t>(num_inputs); ++k)
                vi_mean += nn_times[k];
            vi_mean /= static_cast<double>(num_inputs);
            std::cout << "    variant " << std::setw(2) << vi
                      << "  mean=" << std::fixed << std::setprecision(3)
                      << vi_mean << " ms\n";
        }
        all_nn_times.insert(all_nn_times.end(), nn_times.begin(), nn_times.end());

        results.push_back({n, computeStats(solver_times), computeStats(nn_times)});
    }

    // Overall stats computed from all raw datapoints.
    Stats overall_solver = computeStats(all_solver_times);
    Stats overall_nn     = computeStats(all_nn_times);

    // ── text output ───────────────────────────────────────────────────────────
    std::string txt_path = out_base + ".txt";
    std::ofstream f(txt_path);
    if (!f) { std::cerr << "Cannot open " << txt_path << "\n"; return 1; }

    auto hr = [&]() { f << std::string(70, '-') << "\n"; };

    f << "QDTS Solver Comparison Benchmark\n";
    f << "inputs per N (qdts.solver)              : " << num_inputs << "\n";
    f << "inputs per N per variant (qdts.solver_nn): " << num_inputs << "\n";
    f << "variants                                : " << NUM_VARIANTS << "\n";
    f << "N range                                 : " << N_MIN << " – " << N_MAX << "\n\n";

    f << std::left
      << std::setw(5)  << "N"
      << std::setw(18) << "solver mean (ms)"
      << std::setw(18) << "solver std (ms)"
      << std::setw(18) << "solver_nn mean (ms)"
      << std::setw(18) << "solver_nn std (ms)"
      << "\n";
    hr();
    f << std::fixed << std::setprecision(4);
    for (auto& r : results) {
        f << std::left
          << std::setw(5)  << r.n
          << std::setw(18) << r.solver.mean
          << std::setw(18) << r.solver.std_dev
          << std::setw(18) << r.solver_nn.mean
          << std::setw(18) << r.solver_nn.std_dev
          << "\n";
    }
    hr();
    f << std::left
      << std::setw(5)  << "ALL"
      << std::setw(18) << overall_solver.mean
      << std::setw(18) << overall_solver.std_dev
      << std::setw(18) << overall_nn.mean
      << std::setw(18) << overall_nn.std_dev
      << "\n";
    f.close();
    std::cout << "\nText results  → " << txt_path << "\n";

    // ── CSV output (used by the plotting script) ──────────────────────────────
    std::string csv_path = out_base + ".csv";
    std::ofstream c(csv_path);
    if (!c) { std::cerr << "Cannot open " << csv_path << "\n"; return 1; }
    c << "N,solver_mean_ms,solver_std_ms,solver_nn_mean_ms,solver_nn_std_ms\n";
    c << std::fixed << std::setprecision(6);
    for (auto& r : results)
        c << r.n << ","
          << r.solver.mean    << "," << r.solver.std_dev    << ","
          << r.solver_nn.mean << "," << r.solver_nn.std_dev << "\n";
    c.close();
    std::cout << "CSV results   → " << csv_path << "\n";

    // ── LaTeX output ──────────────────────────────────────────────────────────
    std::string tex_path = out_base + ".tex";
    std::ofstream t(tex_path);
    if (!t) { std::cerr << "Cannot open " << tex_path << "\n"; return 1; }

    // Requires: booktabs, siunitx, multirow
    t << "% Auto-generated by benchmark_comparison — do not edit\n"
         "% Required packages: booktabs, siunitx, multirow\n";
    t << "\\begin{table}[t]\n"
         "\\centering\n";
    t << "\\caption{Computation time of \\texttt{qdts.solver} (Newton--Raphson) and\n"
         "  \\texttt{qdts.solver\\_nn} (neural network, ONNX) for target spectra of\n"
         "  size~$N$. Each \\texttt{qdts.solver} cell aggregates " << num_inputs
      << "~random inputs;\n"
         "  each \\texttt{qdts.solver\\_nn} cell aggregates " << num_inputs
      << "~inputs across all " << NUM_VARIANTS << "~model variants.\n"
         "  Values are reported as mean~$\\pm$~standard deviation.}\n";
    t << "\\label{tab:solver_benchmark}\n";
    // siunitx S columns: numbers aligned on decimal point; headers wrapped in {}
    t << "\\begin{tabular}{"
         "  c"
         "  S[table-format=3.3] @{\\;$\\pm$\\;} S[table-format=3.3]"
         "  S[table-format=1.3] @{\\;$\\pm$\\;} S[table-format=1.3]"
         "}\n";
    t << "\\toprule\n";
    t << "\\multirow{2}{*}{$N$}"
         " & \\multicolumn{2}{c}{\\texttt{qdts.solver}}"
         " & \\multicolumn{2}{c}{\\texttt{qdts.solver\\_nn}} \\\\\n";
    t << "\\cmidrule(lr){2-3} \\cmidrule(lr){4-5}\n";
    t << " & {mean / \\si{\\milli\\second}} & {std / \\si{\\milli\\second}}"
         " & {mean / \\si{\\milli\\second}} & {std / \\si{\\milli\\second}} \\\\\n";
    t << "\\midrule\n";

    t << std::fixed << std::setprecision(3);
    for (auto& r : results) {
        t << r.n
          << " & " << r.solver.mean    << " & " << r.solver.std_dev
          << " & " << r.solver_nn.mean << " & " << r.solver_nn.std_dev
          << " \\\\\n";
    }

    t << "\\midrule\n";
    t << "\\textbf{Overall}"
      << " & " << overall_solver.mean    << " & " << overall_solver.std_dev
      << " & " << overall_nn.mean        << " & " << overall_nn.std_dev
      << " \\\\\n";
    t << "\\bottomrule\n"
         "\\end{tabular}\n"
         "\\end{table}\n";
    t.close();
    std::cout << "LaTeX results → " << tex_path << "\n";

    return 0;
}
