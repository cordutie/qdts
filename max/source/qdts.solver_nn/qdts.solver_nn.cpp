/**
 * qdts.solver_nn
 *
 * Neural-network-based QDTS (Quadratic Difference Tone Spectra) solver.
 * Given a list of N target amplitudes (N = 5..16) it returns the carrier
 * complex amplitudes needed to evoke the requested auditory distortion spectrum,
 * using a pre-trained ONNX model stored in the package resources folder.
 *
 * Inlets
 * ------
 *   1  (list)  Target amplitude distribution  (N floats, N in [5, 16])
 *
 * Outlets  (send right-to-left for safe downstream chaining)
 * -------
 *   1  (list)   Carrier amplitudes  — non-clamped         (N+1 floats)
 *   2  (float)  Reconstruction error — non-clamped        (MSE)
 *   3  (list)   Carrier amplitudes  — clamped to [−2, 2]  (N+1 floats)
 *   4  (float)  Reconstruction error — clamped            (MSE)
 *
 * Inspector attributes
 * --------------------
 *   variant  long   Model variant index, 0-based, alphabetical order (0–15).
 *                   If out of range, the highest valid index is used with a warning.
 *   clamp    bool   Informational flag; all four outlets always fire regardless.
 */

#include "c74_min.h"
#include "onnxruntime_cxx_api.h"
#include "qdts_shared.h"

#include <array>
#include <memory>
#include <string>
#include <vector>

using namespace c74::min;

// ─────────────────────────────────────────────────────────────────────────────
static constexpr int N_MIN        = 5;
static constexpr int N_MAX        = 16;
static constexpr int NUM_VARIANTS = 16;

static constexpr const char* IN_NAMES[]  = {"T", "variant_index"};
static constexpr const char* OUT_NAMES[] = {"X_hat", "error", "X_hat_clamped", "error_clamped"};

// ─────────────────────────────────────────────────────────────────────────────
class solver_nn : public object<solver_nn> {
public:
    MIN_DESCRIPTION { "Neural-network QDTS solver. "
                      "Receives a list of N target amplitudes (N=5..16) and outputs "
                      "carrier complex amplitudes (clamped and non-clamped) to 4 outlets." };
    MIN_TAGS        { "math, operators" };
    MIN_AUTHOR      { "Gutierrez, E. and Cadiz, R." };

    // ── Inlets / Outlets ─────────────────────────────────────────────────────
    inlet<>  in_target   { this, "(list) target amplitude distribution (N floats, N = 5..16)" };

    outlet<> out_carrier    { this, "(list) carrier amplitudes, non-clamped" };
    outlet<> out_error      { this, "(float) reconstruction error, non-clamped" };
    outlet<> out_carrier_c  { this, "(list) carrier amplitudes, clamped to [-2, 2]" };
    outlet<> out_error_c    { this, "(float) reconstruction error, clamped" };

    // ── Inspector attributes ──────────────────────────────────────────────────
    attribute<long> variant { this, "variant", 0,
        description { "Model variant index (0–15). "
                      "Selects among the 16 trained checkpoints for the given N "
                      "(sorted alphabetically by filename). "
                      "Out-of-range values are clamped to the highest valid index." }
    };

    attribute<bool> clamp { this, "clamp", false,
        description { "Informational flag. "
                      "All four outlets fire regardless. "
                      "Use it to annotate your patch about intended usage." }
    };

    // ── Constructor ───────────────────────────────────────────────────────────
    solver_nn(const atoms& args = {}) {
        ONNXManager::get_env();  // increment ref-count / initialise env
    }

    // ── Destructor ────────────────────────────────────────────────────────────
    ~solver_nn() {
        session_.reset();
        ONNXManager::release_env();
    }

    // ── List message handler ──────────────────────────────────────────────────
    message<> list { this, "list", "Target amplitude distribution.",
        MIN_FUNCTION {
            const int n = static_cast<int>(args.size());

            // ── Validate N ────────────────────────────────────────────────────
            if (n < N_MIN || n > N_MAX) {
                cerr << "qdts.solver_nn: list length must be " << N_MIN << "–" << N_MAX
                     << ", got " << n << ". Ignoring." << endl;
                return {};
            }

            // ── Validate & clamp variant ──────────────────────────────────────
            long vi = variant.get();
            if (vi < 0 || vi >= NUM_VARIANTS) {
                cerr << "qdts.solver_nn: variant " << vi
                     << " out of range [0, " << (NUM_VARIANTS - 1) << "]"
                     << ", using " << (NUM_VARIANTS - 1) << "." << endl;
                vi = NUM_VARIANTS - 1;
            }

            // ── Load / switch session when N changes ───────────────────────────
            if (n != cached_n_) {
                load_session(n);
                cached_n_ = n;
            }
            if (!session_) {
                cerr << "qdts.solver_nn: no model loaded for N=" << n
                     << ". Check that ONNX files are in the package resources folder." << endl;
                return {};
            }

            // ── Build input tensors ───────────────────────────────────────────
            // T: float32 (1, n)
            std::vector<float> T_data(n);
            for (int i = 0; i < n; ++i)
                T_data[i] = static_cast<float>(args[i]);

            // variant_index: int64 scalar (0-dim)
            int64_t vi64 = static_cast<int64_t>(vi);

            auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

            std::array<int64_t, 2> T_shape  = {1, static_cast<int64_t>(n)};
            std::array<int64_t, 0> vi_shape = {};   // 0-dim scalar

            std::array<Ort::Value, 2> inputs = {
                Ort::Value::CreateTensor<float>(
                    mem, T_data.data(), T_data.size(),
                    T_shape.data(), T_shape.size()),
                Ort::Value::CreateTensor<int64_t>(
                    mem, &vi64, 1,
                    vi_shape.data(), vi_shape.size())
            };

            // ── Run inference ─────────────────────────────────────────────────
            std::vector<Ort::Value> outputs;
            try {
                outputs = session_->Run(
                    Ort::RunOptions { nullptr },
                    IN_NAMES,  inputs.data(),  inputs.size(),
                    OUT_NAMES, 4);
            } catch (const Ort::Exception& e) {
                cerr << "qdts.solver_nn: inference failed: " << e.what() << endl;
                return {};
            }

            // ── Extract results ───────────────────────────────────────────────
            // X_hat / X_hat_clamped: (1, n+1)  → trim batch dim
            const float* x_ptr   = outputs[0].GetTensorData<float>();
            const float* xc_ptr  = outputs[2].GetTensorData<float>();
            const float  err     = *outputs[1].GetTensorData<float>();
            const float  err_c   = *outputs[3].GetTensorData<float>();

            const int out_size = n + 1;

            atoms carrier(out_size), carrier_c(out_size);
            for (int i = 0; i < out_size; ++i) {
                carrier[i]   = x_ptr[i];
                carrier_c[i] = xc_ptr[i];
            }

            // ── Send outputs right-to-left ─────────────────────────────────────
            out_error_c.send(err_c);
            out_carrier_c.send(carrier_c);
            out_error.send(err);
            out_carrier.send(carrier);

            return {};
        }
    };

    // ── Status message ────────────────────────────────────────────────────────
    message<> status { this, "status", "Print current state to Max console.",
        MIN_FUNCTION {
            cout << "qdts.solver_nn status:" << endl;
            cout << "  cached N      : " << cached_n_ << endl;
            cout << "  variant       : " << variant.get() << endl;
            cout << "  clamp         : " << (clamp.get() ? "true" : "false") << endl;
            cout << "  session loaded: " << (session_ ? "yes" : "no") << endl;
            cout << "  onnx env ok   : " << (ONNXManager::is_available() ? "yes" : "no") << endl;
            if (cached_n_ >= N_MIN) {
                std::string p = QDTSResourceLoader::get_model_path(cached_n_);
                cout << "  model path    : " << (p.empty() ? "<not found>" : p) << endl;
            }
            return {};
        }
    };

private:
    std::unique_ptr<Ort::Session> session_;
    int cached_n_ { -1 };

    void load_session(int n) {
        session_.reset();

        std::string model_path = QDTSResourceLoader::get_model_path(n);
        if (model_path.empty()) {
            cerr << "qdts.solver_nn: model file not found for N=" << n
                 << ". Expected at: <package>/resources/qdts_solver_nn/qdts_solver_N"
                 << n << ".onnx" << endl;
            return;
        }

        try {
            Ort::SessionOptions opts;
            opts.SetIntraOpNumThreads(1);
            opts.SetInterOpNumThreads(1);
            opts.SetGraphOptimizationLevel(GraphOptimizationLevel::ORT_ENABLE_ALL);

            session_ = std::make_unique<Ort::Session>(
                ONNXManager::get_env(), model_path.c_str(), opts);

            cout << "qdts.solver_nn: loaded model for N=" << n << endl;
        } catch (const Ort::Exception& e) {
            cerr << "qdts.solver_nn: failed to load model for N=" << n
                 << ": " << e.what() << endl;
            session_.reset();
        }
    }
};

MIN_EXTERNAL(solver_nn);
