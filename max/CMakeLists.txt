cmake_minimum_required(VERSION 3.16)

project(qdts
        VERSION 1.0.0
        LANGUAGES CXX
)

# ── Build settings ─────────────────────────────────────────────────────────────
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if(WIN32)
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    add_definitions(-D_WIN32_WINNT=0x0601 -DNOMINMAX -DWIN32_LEAN_AND_MEAN)
endif()
if(MSVC)
    add_definitions(-D_CRT_NONSTDC_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS -DUSE_JITTER_ROUND)
endif()

# ── Platform detection ─────────────────────────────────────────────────────────
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
    set(PLATFORM_WINDOWS TRUE)
    set(PLATFORM_MACOS   FALSE)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    set(PLATFORM_WINDOWS FALSE)
    set(PLATFORM_MACOS   TRUE)
    # Default arm64; override with -DCMAKE_OSX_ARCHITECTURES=x86_64 for Intel
    if(NOT CMAKE_OSX_ARCHITECTURES)
        set(CMAKE_OSX_ARCHITECTURES "arm64" CACHE STRING "macOS target architecture" FORCE)
    endif()
else()
    message(FATAL_ERROR "Unsupported platform: ${CMAKE_SYSTEM_NAME}")
endif()

# ── Codesigning (macOS) ────────────────────────────────────────────────────────
if(PLATFORM_MACOS)
    set(CODESIGN_IDENTITY   ""  CACHE STRING "Signing identity (empty = ad-hoc)")
    set(ENABLE_CODESIGNING  ON  CACHE BOOL   "Enable automatic codesigning")
    if(ENABLE_CODESIGNING)
        if(CODESIGN_IDENTITY STREQUAL "")
            set(CODESIGN_FLAGS --force --deep -s -)
        else()
            set(CODESIGN_FLAGS --force --options runtime --timestamp --deep -s "${CODESIGN_IDENTITY}")
        endif()
    endif()
endif()

# ── Min-API (C++ wrapper for Max externals, includes Eigen) ────────────────────
include(cmake/CPM.cmake)
CPMAddPackage(
    NAME MinAPI
    GITHUB_REPOSITORY Cycling74/min-api
    GIT_TAG main
)
if(NOT MinAPI_ADDED)
    message(FATAL_ERROR "Failed to fetch Min-API via CPM.")
endif()
set(MIN_API_ROOT ${MinAPI_SOURCE_DIR})
message(STATUS "Min-API: ${MIN_API_ROOT}")

# ── Max SDK (needed for MaxAPI.lib / MaxAudio.lib on Windows) ─────────────────
set(MAX_SDK_ROOT "${CMAKE_SOURCE_DIR}/lib/max-sdk")
if(NOT EXISTS "${MAX_SDK_ROOT}/source/max-sdk-base")
    if(PLATFORM_WINDOWS)
        execute_process(
            COMMAND cmd /c "${CMAKE_SOURCE_DIR}/clone_minapi.bat"
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            RESULT_VARIABLE _res
        )
    else()
        execute_process(
            COMMAND bash "${CMAKE_SOURCE_DIR}/clone_minapi.sh"
            WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
            RESULT_VARIABLE _res
        )
    endif()
    if(NOT _res EQUAL 0)
        message(FATAL_ERROR "clone_minapi script failed. Please run it manually.")
    endif()
endif()
message(STATUS "Max SDK: ${MAX_SDK_ROOT}")

# ── ONNX Runtime ──────────────────────────────────────────────────────────────
if(PLATFORM_WINDOWS)
    set(ONNX_ARCHIVE_NAME "onnxruntime-win-x64-static_lib-1.20.1.tar.bz2")
    set(ONNX_SUBDIR_NAME  "onnxruntime-win-x64-static_lib-1.20.1")
elseif(PLATFORM_MACOS)
    if(CMAKE_OSX_ARCHITECTURES MATCHES "x86_64" OR CMAKE_SYSTEM_PROCESSOR STREQUAL "x86_64")
        set(ONNX_ARCHIVE_NAME "onnxruntime-osx-x86_64-static_lib-1.22.0.zip")
        set(ONNX_SUBDIR_NAME  "onnxruntime-osx-x86_64-static_lib-1.22.0")
    else()
        set(ONNX_ARCHIVE_NAME "onnxruntime-osx-arm64-static_lib-1.20.0.zip")
        set(ONNX_SUBDIR_NAME  "onnxruntime-osx-arm64-static_lib-1.20.0")
    endif()
endif()

set(ONNX_ARCHIVE_FILE "${CMAKE_SOURCE_DIR}/${ONNX_ARCHIVE_NAME}")
if(NOT EXISTS "${ONNX_ARCHIVE_FILE}")
    message(FATAL_ERROR "ONNX archive not found: ${ONNX_ARCHIVE_FILE}")
endif()

set(ONNX_UNPACK_DIR "${CMAKE_BINARY_DIR}/external/onnxruntime_prebuilt")
set(ONNX_ROOT_DIR   "${ONNX_UNPACK_DIR}/${ONNX_SUBDIR_NAME}")
set(ONNX_HEADER_CHECK "${ONNX_ROOT_DIR}/include/onnxruntime_c_api.h")

if(NOT EXISTS "${ONNX_HEADER_CHECK}")
    message(STATUS "Unpacking ONNX Runtime: ${ONNX_ARCHIVE_FILE}")
    file(MAKE_DIRECTORY "${ONNX_UNPACK_DIR}")

    if(PLATFORM_WINDOWS)
        # Try 7-Zip → WinRAR → tar+bzip2 in order
        set(EXTRACTION_SUCCESS FALSE)

        find_program(SEVEN_ZIP 7z PATHS "C:/Program Files/7-Zip" "C:/Program Files (x86)/7-Zip")
        if(SEVEN_ZIP AND NOT EXTRACTION_SUCCESS)
            execute_process(COMMAND ${SEVEN_ZIP} x "${ONNX_ARCHIVE_FILE}" -o"${ONNX_UNPACK_DIR}" -y
                            RESULT_VARIABLE _r OUTPUT_QUIET ERROR_QUIET)
            if(_r EQUAL 0)
                file(GLOB _tar "${ONNX_UNPACK_DIR}/*.tar")
                if(_tar)
                    execute_process(COMMAND ${SEVEN_ZIP} x "${_tar}" -o"${ONNX_UNPACK_DIR}" -y
                                    RESULT_VARIABLE _r2 OUTPUT_QUIET ERROR_QUIET)
                    if(_r2 EQUAL 0)
                        set(EXTRACTION_SUCCESS TRUE)
                        file(REMOVE ${_tar})
                    endif()
                endif()
            endif()
        endif()

        find_program(WINRAR winrar PATHS "C:/Program Files/WinRAR" "C:/Program Files (x86)/WinRAR")
        if(WINRAR AND NOT EXTRACTION_SUCCESS)
            execute_process(COMMAND ${WINRAR} x -y "${ONNX_ARCHIVE_FILE}" "${ONNX_UNPACK_DIR}/"
                            RESULT_VARIABLE _r OUTPUT_QUIET ERROR_QUIET)
            if(_r EQUAL 0)
                set(EXTRACTION_SUCCESS TRUE)
            endif()
        endif()

        find_program(TAR tar)
        find_program(BZIP2 bzip2)
        if(TAR AND BZIP2 AND NOT EXTRACTION_SUCCESS)
            execute_process(COMMAND ${TAR} -xjf "${ONNX_ARCHIVE_FILE}" -C "${ONNX_UNPACK_DIR}"
                            RESULT_VARIABLE _r OUTPUT_QUIET ERROR_QUIET)
            if(_r EQUAL 0)
                set(EXTRACTION_SUCCESS TRUE)
            endif()
        endif()

        if(NOT EXTRACTION_SUCCESS)
            message(FATAL_ERROR
                "Could not extract ${ONNX_ARCHIVE_FILE}.\n"
                "Install 7-Zip, WinRAR, or Git for Windows (includes bzip2), "
                "or extract manually to: ${ONNX_UNPACK_DIR}")
        endif()
    else()
        execute_process(
            COMMAND unzip -o -q "${ONNX_ARCHIVE_FILE}" -d "${ONNX_UNPACK_DIR}"
            RESULT_VARIABLE _r
        )
        if(NOT _r EQUAL 0)
            message(FATAL_ERROR "Failed to unzip ${ONNX_ARCHIVE_FILE}")
        endif()
    endif()
endif()
message(STATUS "ONNX unpacked: ${ONNX_ROOT_DIR}")

# Find ONNX library
if(PLATFORM_WINDOWS)
    if(EXISTS "${ONNX_ROOT_DIR}/lib/onnxruntime.lib")
        set(ONNX_LIB "${ONNX_ROOT_DIR}/lib/onnxruntime.lib")
        set(ONNX_IS_STATIC TRUE)
    else()
        message(FATAL_ERROR "onnxruntime.lib not found in ${ONNX_ROOT_DIR}/lib")
    endif()
else()
    if(EXISTS "${ONNX_ROOT_DIR}/lib/libonnxruntime.a")
        set(ONNX_LIB "${ONNX_ROOT_DIR}/lib/libonnxruntime.a")
        set(ONNX_IS_STATIC TRUE)
    elseif(EXISTS "${ONNX_ROOT_DIR}/lib/libonnxruntime.dylib")
        set(ONNX_LIB "${ONNX_ROOT_DIR}/lib/libonnxruntime.dylib")
        set(ONNX_IS_STATIC FALSE)
    else()
        message(FATAL_ERROR "libonnxruntime not found in ${ONNX_ROOT_DIR}/lib")
    endif()
endif()
message(STATUS "ONNX lib: ${ONNX_LIB}  (static=${ONNX_IS_STATIC})")

# ── Platform libraries ─────────────────────────────────────────────────────────
if(PLATFORM_WINDOWS)
    set(PLATFORM_LIBRARIES kernel32 user32 gdi32 winspool shell32 ole32 oleaut32
                           uuid comdlg32 advapi32 winmm ws2_32 crypt32 bcrypt)
else()
    find_library(FW_COREFOUNDATION  CoreFoundation  REQUIRED)
    find_library(FW_FOUNDATION      Foundation      REQUIRED)
    find_library(FW_CORESERVICES   CoreServices    REQUIRED)
    find_library(FW_SECURITY        Security        REQUIRED)
    find_library(FW_SYSCONFIG       SystemConfiguration REQUIRED)
    find_library(FW_ACCELERATE      Accelerate      REQUIRED)
    find_library(FW_COREML          CoreML)
    find_library(LIB_OBJC           objc            REQUIRED)
    set(PLATFORM_LIBRARIES
        ${FW_COREFOUNDATION} ${FW_FOUNDATION} ${FW_CORESERVICES}
        ${FW_SECURITY} ${FW_SYSCONFIG} ${FW_ACCELERATE} ${LIB_OBJC})
    if(FW_COREML)
        list(APPEND PLATFORM_LIBRARIES ${FW_COREML})
    endif()
endif()

# ── Common include paths ───────────────────────────────────────────────────────
set(COMMON_INCLUDES
    ${MIN_API_ROOT}/include                             # c74_min.h + Eigen
    ${MAX_SDK_ROOT}/source/max-sdk-base/c74support
    ${MAX_SDK_ROOT}/source/max-sdk-base/c74support/max-includes
    ${ONNX_ROOT_DIR}/include                            # onnxruntime_cxx_api.h
    ${CMAKE_SOURCE_DIR}/source/include                  # qdts_shared.h, onnx_helpers.h
)

# ── Max package deployment paths ──────────────────────────────────────────────
set(MAX_VERSION      "Max 9"  CACHE STRING "Max user folder name (e.g. 'Max 8' or 'Max 9')")
set(MAX_PACKAGE_NAME "qdts"   CACHE STRING "Package folder name")

if(PLATFORM_WINDOWS)
    set(MAX_USER_PACKAGES_DIR "$ENV{USERPROFILE}/Documents/${MAX_VERSION}/Packages"
        CACHE PATH "Max Packages directory")
    set(EXTERNAL_EXTENSION "mxe64")
else()
    set(MAX_USER_PACKAGES_DIR "$ENV{HOME}/Documents/${MAX_VERSION}/Packages"
        CACHE PATH "Max Packages directory")
    set(EXTERNAL_EXTENSION "mxo")
endif()

set(MAX_PACKAGE_DIR   "${MAX_USER_PACKAGES_DIR}/${MAX_PACKAGE_NAME}")
set(MAX_EXTERNALS_DIR "${MAX_PACKAGE_DIR}/externals")
set(MAX_RESOURCES_DIR "${MAX_PACKAGE_DIR}/resources")
message(STATUS "Package: ${MAX_PACKAGE_DIR}")

# ── Helper: deployment ─────────────────────────────────────────────────────────
function(setup_external_deployment TARGET_NAME)
    if(PLATFORM_WINDOWS)
        add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory "${MAX_EXTERNALS_DIR}"
            COMMAND ${CMAKE_COMMAND} -E copy_if_different
                "${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}"
                "${MAX_EXTERNALS_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}"
            COMMENT "Deployed ${TARGET_NAME}.${EXTERNAL_EXTENSION}"
        )
    else()
        set(BUNDLE_PATH "${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}")
        if(ENABLE_CODESIGNING)
            add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
                COMMAND xattr -r -d com.apple.quarantine "${BUNDLE_PATH}" || true
                COMMAND codesign ${CODESIGN_FLAGS} "${BUNDLE_PATH}"
                COMMENT "Codesigning ${TARGET_NAME}"
                VERBATIM
            )
        endif()
        add_custom_command(TARGET ${TARGET_NAME} POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E make_directory "${MAX_EXTERNALS_DIR}"
            COMMAND ${CMAKE_COMMAND} -E remove_directory
                "${MAX_EXTERNALS_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}"
            COMMAND ${CMAKE_COMMAND} -E copy_directory
                "${BUNDLE_PATH}"
                "${MAX_EXTERNALS_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}"
            COMMENT "Deployed ${TARGET_NAME}.${EXTERNAL_EXTENSION}"
        )
    endif()
endfunction()

# ── Helper: simple external (no ONNX) ─────────────────────────────────────────
function(create_simple_external TARGET_NAME SOURCE_FILE)
    add_library(${TARGET_NAME} MODULE ${SOURCE_FILE})
    target_include_directories(${TARGET_NAME} PRIVATE ${COMMON_INCLUDES})

    if(PLATFORM_WINDOWS)
        find_library(MAXAPI_LIB MaxAPI
            PATHS "${MAX_SDK_ROOT}/source/max-sdk-base/c74support/max-includes/x64"
            NO_DEFAULT_PATH)
        if(NOT MAXAPI_LIB)
            message(FATAL_ERROR "MaxAPI.lib not found in Max SDK")
        endif()
        target_link_libraries(${TARGET_NAME} PRIVATE ${PLATFORM_LIBRARIES} ${MAXAPI_LIB})
        set_target_properties(${TARGET_NAME} PROPERTIES
            SUFFIX ".${EXTERNAL_EXTENSION}" OUTPUT_NAME ${TARGET_NAME})
    else()
        target_link_libraries(${TARGET_NAME} PRIVATE ${PLATFORM_LIBRARIES})
        set_target_properties(${TARGET_NAME} PROPERTIES
            LINK_FLAGS "-undefined dynamic_lookup"
            BUNDLE TRUE
            BUNDLE_EXTENSION ${EXTERNAL_EXTENSION}
            OUTPUT_NAME ${TARGET_NAME}
            RUNTIME_OUTPUT_DIRECTORY
                "${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}/Contents/MacOS"
        )
        configure_file(${CMAKE_SOURCE_DIR}/cmake/Info.plist.in
            ${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}/Contents/Info.plist @ONLY)
    endif()
    setup_external_deployment(${TARGET_NAME})
endfunction()

# ── Helper: ONNX external ─────────────────────────────────────────────────────
function(create_onnx_external TARGET_NAME SOURCE_FILE)
    add_library(${TARGET_NAME} MODULE ${SOURCE_FILE})
    target_include_directories(${TARGET_NAME} PRIVATE ${COMMON_INCLUDES})

    if(PLATFORM_WINDOWS)
        find_library(MAXAPI_LIB MaxAPI
            PATHS "${MAX_SDK_ROOT}/source/max-sdk-base/c74support/max-includes/x64"
            NO_DEFAULT_PATH)
        if(NOT MAXAPI_LIB)
            message(FATAL_ERROR "MaxAPI.lib not found in Max SDK")
        endif()
        target_link_libraries(${TARGET_NAME} PRIVATE
            "${ONNX_LIB}" ${PLATFORM_LIBRARIES} ${MAXAPI_LIB})
        target_link_options(${TARGET_NAME} PRIVATE /FORCE:MULTIPLE /IGNORE:4006)
        set_target_properties(${TARGET_NAME} PROPERTIES
            SUFFIX ".${EXTERNAL_EXTENSION}" OUTPUT_NAME ${TARGET_NAME})
    else()
        target_link_libraries(${TARGET_NAME} PRIVATE "${ONNX_LIB}" ${PLATFORM_LIBRARIES})
        set_target_properties(${TARGET_NAME} PROPERTIES
            LINK_FLAGS "-undefined dynamic_lookup"
            BUNDLE TRUE
            BUNDLE_EXTENSION ${EXTERNAL_EXTENSION}
            OUTPUT_NAME ${TARGET_NAME}
            RUNTIME_OUTPUT_DIRECTORY
                "${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}/Contents/MacOS"
        )
        configure_file(${CMAKE_SOURCE_DIR}/cmake/Info.plist.in
            ${CMAKE_BINARY_DIR}/${TARGET_NAME}.${EXTERNAL_EXTENSION}/Contents/Info.plist @ONLY)
    endif()
    setup_external_deployment(${TARGET_NAME})
endfunction()

# ── Helper: copy ONNX model resources ─────────────────────────────────────────
function(setup_qdts_resources)
    set(ONNX_SRC_DIR "${CMAKE_SOURCE_DIR}/../experiments/qdts_solver_nn/onnx_exports")
    set(ONNX_DEST_DIR "${MAX_RESOURCES_DIR}/qdts_solver_nn")

    add_custom_target(CopyQDTSResources ALL)

    add_custom_command(TARGET CopyQDTSResources POST_BUILD
        COMMAND ${CMAKE_COMMAND} -E make_directory "${ONNX_DEST_DIR}"
        COMMENT "Created resources/qdts_solver_nn"
    )

    foreach(N RANGE 5 16)
        set(ONNX_FILE "${ONNX_SRC_DIR}/qdts_solver_N${N}.onnx")
        if(EXISTS "${ONNX_FILE}")
            add_custom_command(TARGET CopyQDTSResources POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E copy_if_different
                    "${ONNX_FILE}" "${ONNX_DEST_DIR}/qdts_solver_N${N}.onnx"
                COMMENT "Copied qdts_solver_N${N}.onnx"
            )
        else()
            message(WARNING "ONNX model not found: ${ONNX_FILE} — run onnx_wrapper.py first")
        endif()
    endforeach()
endfunction()

# ── Externals ──────────────────────────────────────────────────────────────────
create_simple_external(qdts.solver    source/qdts.solver/roots.solver.cpp)
create_onnx_external(qdts.solver_nn   source/qdts.solver_nn/qdts.solver_nn.cpp)

# ── Model resources ────────────────────────────────────────────────────────────
setup_qdts_resources()
add_dependencies(qdts.solver_nn CopyQDTSResources)

# ── Group target ───────────────────────────────────────────────────────────────
add_custom_target(qdts_all DEPENDS qdts.solver qdts.solver_nn CopyQDTSResources)

# ── Build summary ──────────────────────────────────────────────────────────────
message(STATUS "")
message(STATUS "── QDTS Max Externals ────────────────────────────────────────")
message(STATUS "  Platform   : ${CMAKE_SYSTEM_NAME} / ${CMAKE_OSX_ARCHITECTURES}")
message(STATUS "  Package    : ${MAX_PACKAGE_DIR}")
message(STATUS "  Externals  : ${MAX_EXTERNALS_DIR}")
message(STATUS "  Resources  : ${MAX_RESOURCES_DIR}/qdts_solver_nn/")
message(STATUS "  ONNX lib   : ${ONNX_LIB}")
message(STATUS "")
message(STATUS "  Targets:")
message(STATUS "    qdts.solver      — Newton-Raphson numerical solver")
message(STATUS "    qdts.solver_nn   — Neural network solver (ONNX)")
message(STATUS "    qdts_all         — Build both + copy resources")
message(STATUS "─────────────────────────────────────────────────────────────")
message(STATUS "")
if(PLATFORM_MACOS)
    message(STATUS "  Intel build: cmake -DCMAKE_OSX_ARCHITECTURES=x86_64 .")
    message(STATUS "  Codesign:   cmake -DCODESIGN_IDENTITY=\"Developer ID...\" .")
    message(STATUS "  No signing: cmake -DENABLE_CODESIGNING=OFF .")
endif()
