#pragma once
#include <onnxruntime_cxx_api.h>
#include <vector>
#include <cstdint>
#include <cstring>   // std::memcpy
#include <numeric>   // std::accumulate

// Allocate ONNX tensor memory and copy data in (avoids aliasing/lifetime issues)
// Now uses instance-specific allocator instead of thread_local static
inline Ort::Value vector_to_tensor(const std::vector<float>& data,
                                   const std::vector<int64_t>& shape,
                                   Ort::AllocatorWithDefaultOptions& allocator) {
    // Compute expected element count from shape
    size_t expected = 1;
    for (auto d : shape) expected *= static_cast<size_t>(d);

    if (data.size() != expected) {
        throw std::runtime_error("vector_to_tensor: size mismatch (data.size()="
                                 + std::to_string(data.size()) + ", expected="
                                 + std::to_string(expected) + ")");
    }

    Ort::Value t = Ort::Value::CreateTensor<float>(allocator, shape.data(), shape.size());
    std::memcpy(t.GetTensorMutableData<float>(), data.data(), expected * sizeof(float));
    return t;
}

inline Ort::Value vector_to_tensor_i64(const std::vector<int64_t>& data,
                                       const std::vector<int64_t>& shape,
                                       Ort::AllocatorWithDefaultOptions& allocator) {
    size_t expected = 1;
    for (auto d : shape) expected *= static_cast<size_t>(d);

    if (data.size() != expected) {
        throw std::runtime_error("vector_to_tensor_i64: size mismatch (data.size()="
                                 + std::to_string(data.size()) + ", expected="
                                 + std::to_string(expected) + ")");
    }

    Ort::Value t = Ort::Value::CreateTensor<int64_t>(allocator, shape.data(), shape.size());
    std::memcpy(t.GetTensorMutableData<int64_t>(), data.data(), expected * sizeof(int64_t));
    return t;
}

inline std::vector<float> tensor_to_vector(const Ort::Value& v) {
    const float* p = v.GetTensorData<float>();
    size_t n = 1;
    auto info = v.GetTensorTypeAndShapeInfo();
    for (auto d : info.GetShape()) n *= static_cast<size_t>(d);
    return std::vector<float>(p, p + n);
}