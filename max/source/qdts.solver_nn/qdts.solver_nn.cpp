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
 *   1  (list)   Carrier amplitudes             (N+1 floats)
 *   2  (float)  Reconstruction error           (MSE)
 *
 * Inspector attributes
 * --------------------
 *   clamp    bool   When ON (default), outputs the clamped carriers (clamped to [−2, 2])
 *                   and the corresponding clamped reconstruction error.
 *                   When OFF, outputs the raw network prediction.
 *   variant  long   Model variant index, 0-based, alphabetical order (0–15).
 *                   If out of range, the highest valid index is used with a warning.
 *                   Changing variant automatically re-runs inference on the last input.
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
    // ── Private data first ────────────────────────────────────────────────────
    // IMPORTANT: these members must be declared before any Min API attribute that
    // has a setter, because Min calls the setter immediately during attribute
    // construction (to apply the default value).  C++ initialises members in
    // declaration order, so anything referenced inside a setter lambda must
    // already be constructed at that point.
    std::unique_ptr<Ort::Session> session_;
    int cached_n_ { -1 };
    std::vector<float> cached_T_;   // last received input, used for variant-change re-runs

public:
    MIN_DESCRIPTION { "Neural-network QDTS solver. "
                      "Receives a list of N target amplitudes (N=5..16) and outputs "
                      "carrier amplitudes and reconstruction error. "
                      "Set the 'clamp' attribute to return values clamped to [-2, 2]." };
    MIN_TAGS        { "math, operators" };
    MIN_AUTHOR      { "Gutierrez, E. and Cadiz, R." };

    // ── Inlets / Outlets ─────────────────────────────────────────────────────
    inlet<>  in_target  { this, "(list) target amplitude distribution (N floats, N = 5..16)" };

    outlet<> out_carrier { this, "(list) carrier amplitudes (N+1 floats)" };
    outlet<> out_error   { this, "(float) reconstruction error (MSE)" };

    // ── Inspector attributes ──────────────────────────────────────────────────
    attribute<bool> debug { this, "debug", false,
        description { "When ON, diagnostic messages are printed to the Max console. "
                      "OFF by default." }
    };

    attribute<bool> clamp { this, "clamp", true,
        description { "When ON (default), outlet 1 carries amplitudes clamped to [−2, 2] "
                      "and outlet 2 carries the corresponding clamped MSE. "
                      "When OFF, the raw network prediction is returned." }
    };

    attribute<long> variant { this, "variant", 0,
        description { "Model variant index (0–15). "
                      "Selects among the 16 trained checkpoints for the given N "
                      "(sorted alphabetically by filename). "
                      "Out-of-range values are clamped to the highest valid index. "
                      "Changing this attribute re-runs inference on the last received input." },
        setter { MIN_FUNCTION {
            // Apply the new value first, then re-run if we have cached input.
            // Return the (possibly clamped) value so Min stores it correctly.
            long new_vi = static_cast<long>(args[0]);
            if (new_vi < 0 || new_vi >= NUM_VARIANTS) {
                if (debug) cerr << "qdts.solver_nn: variant " << new_vi
                                << " out of range [0, " << (NUM_VARIANTS - 1) << "]"
                                << ", using " << (NUM_VARIANTS - 1) << "." << endl;
                new_vi = NUM_VARIANTS - 1;
            }
            // Re-run inference if we already have a cached input.
            if (!cached_T_.empty())
                run_inference(cached_T_, new_vi);
            return { new_vi };
        }}
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
                if (debug) cerr << "qdts.solver_nn: list length must be " << N_MIN << "–" << N_MAX
                                << ", got " << n << ". Ignoring." << endl;
                return {};
            }

            // ── Cache the input ───────────────────────────────────────────────
            cached_T_.resize(n);
            for (int i = 0; i < n; ++i)
                cached_T_[i] = static_cast<float>(args[i]);

            // ── Validate & clamp variant ──────────────────────────────────────
            long vi = variant.get();
            if (vi < 0 || vi >= NUM_VARIANTS) {
                if (debug) cerr << "qdts.solver_nn: variant " << vi
                                << " out of range [0, " << (NUM_VARIANTS - 1) << "]"
                                << ", using " << (NUM_VARIANTS - 1) << "." << endl;
                vi = NUM_VARIANTS - 1;
            }

            run_inference(cached_T_, vi);
            return {};
        }
    };

    // ── Status message ────────────────────────────────────────────────────────
    message<> status { this, "status", "Print current state to Max console.",
        MIN_FUNCTION {
            cout << "qdts.solver_nn status:" << endl;
            cout << "  cached N      : " << cached_n_ << endl;
            cout << "  variant       : " << variant.get() << endl;
            cout << "  clamp         : " << (clamp.get() ? "on" : "off") << endl;
            cout << "  cached input  : " << (cached_T_.empty() ? "none" : std::to_string(cached_T_.size()) + " floats") << endl;
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
    // ── Core inference ────────────────────────────────────────────────────────
    void run_inference(const std::vector<float>& T_data, long vi) {
        const int n = static_cast<int>(T_data.size());

        // ── Load / switch session when N changes ──────────────────────────────
        if (n != cached_n_) {
            load_session(n);
            cached_n_ = n;
        }
        if (!session_) {
            if (debug) cerr << "qdts.solver_nn: no model loaded for N=" << n
                            << ". Check that ONNX files are in the package resources folder." << endl;
            return;
        }

        // ── Build input tensors ───────────────────────────────────────────────
        // T: float32 (1, n)   — need a mutable copy because ORT takes a non-const ptr
        std::vector<float> T_buf(T_data);

        // variant_index: int64 scalar (0-dim)
        int64_t vi64 = static_cast<int64_t>(vi);

        auto mem = Ort::MemoryInfo::CreateCpu(OrtArenaAllocator, OrtMemTypeDefault);

        std::array<int64_t, 2> T_shape  = {1, static_cast<int64_t>(n)};
        std::array<int64_t, 0> vi_shape = {};   // 0-dim scalar

        std::array<Ort::Value, 2> inputs = {
            Ort::Value::CreateTensor<float>(
                mem, T_buf.data(), T_buf.size(),
                T_shape.data(), T_shape.size()),
            Ort::Value::CreateTensor<int64_t>(
                mem, &vi64, 1,
                vi_shape.data(), vi_shape.size())
        };

        // ── Run inference ─────────────────────────────────────────────────────
        std::vector<Ort::Value> outputs;
        try {
            outputs = session_->Run(
                Ort::RunOptions { nullptr },
                IN_NAMES,  inputs.data(),  inputs.size(),
                OUT_NAMES, 4);
        } catch (const Ort::Exception& e) {
            if (debug) cerr << "qdts.solver_nn: inference failed: " << e.what() << endl;
            return;
        }

        // ── Select clamped or raw outputs based on 'clamp' attribute ─────────
        const bool use_clamped = clamp.get();

        const float* x_ptr = use_clamped
            ? outputs[2].GetTensorData<float>()   // X_hat_clamped
            : outputs[0].GetTensorData<float>();   // X_hat

        const float err = use_clamped
            ? *outputs[3].GetTensorData<float>()  // error_clamped
            : *outputs[1].GetTensorData<float>(); // error

        const int out_size = n + 1;
        atoms carrier(out_size);
        for (int i = 0; i < out_size; ++i)
            carrier[i] = x_ptr[i];

        // ── Send outlets right-to-left ────────────────────────────────────────
        out_error.send(err);
        out_carrier.send(carrier);
    }

    void load_session(int n) {
        session_.reset();

        std::string model_path = QDTSResourceLoader::get_model_path(n);
        if (model_path.empty()) {
            if (debug) cerr << "qdts.solver_nn: model file not found for N=" << n
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

            if (debug) cout << "qdts.solver_nn: loaded model for N=" << n << endl;
        } catch (const Ort::Exception& e) {
            if (debug) cerr << "qdts.solver_nn: failed to load model for N=" << n
                            << ": " << e.what() << endl;
            session_.reset();
        }
    }
};

MIN_EXTERNAL(solver_nn);
