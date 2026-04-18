# QDTS Max Externals

Max/MSP externals for the QDTS (Quadratic Difference Tone Spectra) solver.

| External | Description |
|---|---|
| `qdts.solver` | Newton-Raphson numerical solver |
| `qdts.solver_nn` | Neural-network solver (ONNX, N = 5–16) |

---

## Prerequisites

| Tool | macOS | Windows |
|---|---|---|
| CMake ≥ 3.16 | `brew install cmake` | [cmake.org](https://cmake.org/download/) |
| Xcode CLT | `xcode-select --install` | — |
| MSVC 2019/2022 | — | Visual Studio with "Desktop C++" workload |
| Git | built-in / brew | Git for Windows |
| 7-Zip (optional) | — | For `.tar.bz2` extraction |

---

## Step 1 — Navigate to the `max/` directory

```bash
cd max/
```

All commands below run from inside `max/`.

---

## Step 2 — Clone dependencies (Min-API + Max SDK)

CMake does this automatically on first configure, but you can also do it manually beforehand (recommended for slow networks):

**macOS**
```bash
bash clone_minapi.sh
```

**Windows (Command Prompt)**
```bat
clone_minapi.bat
```

This clones into `max/lib/min-api` (includes Eigen as a submodule) and `max/lib/max-sdk`. Safe to re-run — it skips anything already present.

---

## Step 3 — Configure with CMake

Create a build directory and run CMake from inside it.

#### macOS — Apple Silicon (arm64, default)
```bash
cmake -S . -B build
```

#### macOS — Intel (x86_64)
```bash
cmake -S . -B build -DCMAKE_OSX_ARCHITECTURES=x86_64
```

#### macOS — without codesigning (e.g. CI or dev machine without a cert)
```bash
cmake -S . -B build -DENABLE_CODESIGNING=OFF
```

#### macOS — with a Developer ID certificate
```bash
cmake -S . -B build -DCODESIGN_IDENTITY="Developer ID Application: Your Name (TEAMID)"
```

#### Windows (from Developer Command Prompt)
```bat
cmake -S . -B build -G "Visual Studio 17 2022" -A x64
```

**What CMake does automatically:**
- Fetches Min-API via CPM (internet required on first run)
- Runs `clone_minapi.sh/bat` if `lib/max-sdk` is missing
- Unpacks the correct ONNX Runtime archive (`.zip` or `.tar.bz2`) into `build/external/onnxruntime_prebuilt/`

---

## Step 4 — Build

**macOS**
```bash
cmake --build build --config Release
```

Build a specific target:
```bash
cmake --build build --config Release --target qdts.solver      # Newton-Raphson only
cmake --build build --config Release --target qdts.solver_nn   # NN solver only
cmake --build build --config Release --target qdts_all         # both + copy models
```

**Windows**
```bat
cmake --build build --config Release
```

---

## Step 5 — Deployment (automatic)

After a successful build the externals are copied automatically to your Max packages folder:

```
~/Documents/Max 9/Packages/qdts/
  externals/
    qdts.solver.mxo          (macOS)  /  qdts.solver.mxe64          (Windows)
    qdts.solver_nn.mxo       (macOS)  /  qdts.solver_nn.mxe64       (Windows)
  resources/
    qdts_solver_nn/
      qdts_solver_N5.onnx
      ...
      qdts_solver_N16.onnx
```

If your Max folder is `Max 8` instead of `Max 9`, pass:
```bash
cmake -S . -B build -DMAX_VERSION="Max 8"
```

---

## CMake flags reference

| Flag | Default | Effect |
|---|---|---|
| `CMAKE_OSX_ARCHITECTURES` | `arm64` | Set to `x86_64` for Intel Mac |
| `ENABLE_CODESIGNING` | `ON` | `OFF` skips `codesign` post-build step |
| `CODESIGN_IDENTITY` | `""` (ad-hoc) | Pass your Developer ID string |
| `MAX_VERSION` | `"Max 9"` | Matches your `~/Documents/Max X` folder |
| `MAX_PACKAGE_NAME` | `"qdts"` | Name of the installed package folder |

---

## Troubleshooting

**"Min-API failed to fetch"** — CPM needs internet on first configure. If you're offline, run `clone_minapi.sh` manually first; CPM will then find it in the cache.

**"ONNX archive not found"** — Make sure you're running CMake from inside `max/` (or with `-S .` pointing to `max/`) so the `.zip`/`.bz2` files are found next to `CMakeLists.txt`.

**macOS "not verified" / quarantine warning in Max** — The post-build step runs `xattr -r -d com.apple.quarantine` automatically. If you still see it, run manually:
```bash
xattr -rd com.apple.quarantine ~/Documents/Max\ 9/Packages/qdts/
```

**Windows: "onnxruntime.lib not found"** — The `.tar.bz2` extraction requires 7-Zip, WinRAR, or Git for Windows (`tar` + `bzip2`). Install one of them and re-run CMake.
