#pragma once

// qdts_shared.h
// Shared utilities for QDTS Max externals:
//   - ONNXManager  : reference-counted, thread-safe global Ort::Env singleton
//   - QDTSResourceLoader : finds ONNX model files from the Max package resources/

#include "c74_min.h"

#ifdef _WIN32
#  include <windows.h>
#elif defined(__APPLE__)
#  include <CoreFoundation/CoreFoundation.h>
#  include <dlfcn.h>
#endif

#include <onnxruntime_cxx_api.h>

#include <atomic>
#include <fstream>
#include <mutex>
#include <string>

// ─────────────────────────────────────────────────────────────────────────────
// ONNXManager
// Shared Ort::Env singleton. Intentionally leaked on exit to avoid static
// destruction order crashes (same pattern as GrooveTransformerMaxExternal).
// ─────────────────────────────────────────────────────────────────────────────
class ONNXManager {
public:
    static Ort::Env& get_env() {
        std::lock_guard<std::mutex> lock(env_mutex_);
        if (is_shutting_down_.load()) throw std::runtime_error("ONNX environment shutting down");
        if (!env_ || !env_valid_.load()) {
            env_ = new Ort::Env(ORT_LOGGING_LEVEL_WARNING, "qdts_onnx_env");
            env_valid_.store(true);
            std::atexit([] {
                is_shutting_down_.store(true);
                env_valid_.store(false);
                // intentionally leak — OS cleans up on exit
            });
        }
        ref_count_.fetch_add(1);
        return *env_;
    }

    static void release_env() {
        std::lock_guard<std::mutex> lock(env_mutex_);
        if (is_shutting_down_.load() || ref_count_.load() <= 0) return;
        ref_count_.fetch_sub(1);
        // never delete — intentional leak
    }

    static bool is_available() {
        std::lock_guard<std::mutex> lock(env_mutex_);
        return env_ && env_valid_.load() && !is_shutting_down_.load();
    }

private:
    static Ort::Env*          env_;
    static std::mutex         env_mutex_;
    static std::atomic<int>   ref_count_;
    static std::atomic<bool>  is_shutting_down_;
    static std::atomic<bool>  env_valid_;
};

inline Ort::Env*         ONNXManager::env_              = nullptr;
inline std::mutex        ONNXManager::env_mutex_;
inline std::atomic<int>  ONNXManager::ref_count_        {0};
inline std::atomic<bool> ONNXManager::is_shutting_down_ {false};
inline std::atomic<bool> ONNXManager::env_valid_        {false};


// ─────────────────────────────────────────────────────────────────────────────
// QDTSResourceLoader
// Locates ONNX model files using the external binary path to find the
// Max package root, then looks in resources/qdts_solver_nn/.
//
// Expected package layout:
//   ~/Documents/Max 9/Packages/qdts/
//     externals/
//       qdts.solver_nn.mxo/          ← binary lives here (macOS)
//       qdts.solver_nn.mxe64         ← binary lives here (Windows)
//     resources/
//       qdts_solver_nn/
//         qdts_solver_N5.onnx
//         ...
//         qdts_solver_N16.onnx
// ─────────────────────────────────────────────────────────────────────────────
class QDTSResourceLoader {
public:
    // Returns absolute path to qdts_solver_N{n}.onnx, or empty string if not found.
    static std::string get_model_path(int n) {
        std::string root = resources_root();
        if (root.empty()) return "";
        std::string path = root + sep + "qdts_solver_nn" + sep
                         + "qdts_solver_N" + std::to_string(n) + ".onnx";
        return file_exists(path) ? path : "";
    }

    static bool file_exists(const std::string& path) {
        std::ifstream f(path.c_str());
        return f.good();
    }

private:
#ifdef _WIN32
    static constexpr char sep = '\\';
#else
    static constexpr char sep = '/';
#endif

    // Walks from the external binary location up to the package root and
    // returns package_root/resources, or empty string on failure.
    static std::string resources_root() {
#ifdef _WIN32
        HMODULE hModule = nullptr;
        if (GetModuleHandleEx(
                GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
                GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT,
                reinterpret_cast<LPCSTR>(&get_model_path), &hModule)) {
            wchar_t wpath[MAX_PATH];
            if (GetModuleFileNameW(hModule, wpath, MAX_PATH)) {
                std::wstring ws(wpath);
                std::string path(ws.begin(), ws.end());
                auto pos = path.find("\\externals\\");
                if (pos != std::string::npos)
                    return path.substr(0, pos) + "\\resources";
            }
        }
        return "";
#else
        // macOS: binary is at .../qdts/externals/qdts.solver_nn.mxo/Contents/MacOS/qdts.solver_nn
        Dl_info info;
        if (dladdr(reinterpret_cast<void*>(&get_model_path), &info) && info.dli_fname) {
            std::string path(info.dli_fname);
            auto pos = path.find("/externals/");
            if (pos != std::string::npos)
                return path.substr(0, pos) + "/resources";
        }
        return "";
#endif
    }
};
