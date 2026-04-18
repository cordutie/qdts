@echo off
REM clone_minapi.bat
REM Clones Min-API (includes Eigen) and Max SDK into max\lib\.
REM Run from the max\ directory before configuring CMake.

set SCRIPT_DIR=%~dp0
set LIB_DIR=%SCRIPT_DIR%lib
if not exist "%LIB_DIR%" mkdir "%LIB_DIR%"

REM ── Min-API ──────────────────────────────────────────────────────────────────
set MIN_API_DIR=%LIB_DIR%\min-api
if exist "%MIN_API_DIR%\.git" (
    echo min-api already present at %MIN_API_DIR%
) else (
    echo Cloning min-api (with submodules - includes Eigen) ...
    git clone --recurse-submodules https://github.com/Cycling74/min-api.git "%MIN_API_DIR%"
    echo min-api cloned.
)

REM ── Max SDK ───────────────────────────────────────────────────────────────────
set MAX_SDK_DIR=%LIB_DIR%\max-sdk
if exist "%MAX_SDK_DIR%\.git" (
    echo max-sdk already present at %MAX_SDK_DIR%
) else (
    echo Cloning max-sdk ...
    git clone https://github.com/Cycling74/max-sdk.git "%MAX_SDK_DIR%"
    echo max-sdk cloned.
)

echo.
echo Done. You can now run cmake from the max\ directory.
