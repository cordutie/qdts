#!/usr/bin/env python3
"""
analyze_audio.py — offline harmonic analysis for QDTS resynthesis

Detects the fundamental frequency (20–500 Hz) and extracts harmonic amplitudes
per frame from a monophonic audio file. Output is intended to be fed to the
qdts.solver_nn Max patch.

Pipeline:
  1. pYIN F0 estimation with voiced-probability gating
  2. Median filter on F0 for stability
  3. Parabolic-interpolation magnitude extraction at k·F0 (no peak picking)
  4. One-pole smoothing of harmonic amplitudes across frames
  5. Per-frame normalisation to [0.5, 1.0]  (training range of qdts.solver_nn)
  6. Text output: one line per frame — time p1 a1 p2 a2 ... pN aN
     where pk = k·F0 (Hz) and ak = normalised amplitude in [0.5, 1.0]
  7. WAV resynthesis (<stem>_resynth.wav) for quick quality check

Usage:
    python analyze_audio.py <input.wav> [N] [output.json]

Arguments:
    input.wav   path to monophonic audio file
    N           number of harmonics to extract (default: 16)
    output.json output path (default: <stem>_analysis.json)

Dependencies:
    pip install librosa numpy scipy
"""

import sys
import os
import numpy as np
import librosa
import soundfile as sf
from scipy.ndimage import median_filter

# ── tuneable parameters ───────────────────────────────────────────────────────
F0_MIN         = 20.0    # Hz — lower bound for pYIN
F0_MAX         = 500.0   # Hz — upper bound for pYIN
HOP_LENGTH     = 512     # STFT hop size (samples)
N_FFT          = 4096    # FFT size — large for frequency resolution at low F0
VOICED_THRESH  = 0.6     # pYIN voiced-probability threshold
VOICED_GAP_FILL = 8      # fill unvoiced gaps shorter than this many frames
F0_MED_WIN     = 5       # median filter window (frames) for F0 stability
AMP_ALPHA      = 0.7     # one-pole smoothing coefficient (0 = off, →1 = heavy)
AMP_LO         = 0.5     # normalised amplitude lower bound (matches training)
AMP_HI         = 1.0     # normalised amplitude upper bound


# ── helpers ───────────────────────────────────────────────────────────────────

def parabolic_interp_db(mag_db: np.ndarray, bin_float: float) -> float:
    """
    Evaluate a magnitude spectrum (dB) at a fractional bin position using
    parabolic interpolation.  More stable than nearest-bin lookup.
    """
    b = int(bin_float)
    if b < 1 or b >= len(mag_db) - 1:
        return -120.0
    alpha = mag_db[b - 1]
    beta  = mag_db[b]
    gamma = mag_db[b + 1]
    denom = alpha - 2.0 * beta + gamma
    if abs(denom) < 1e-10:
        return float(beta)
    p = np.clip(0.5 * (alpha - gamma) / denom, -1.0, 1.0)
    return float(beta - 0.25 * (alpha - gamma) * p)


def extract_harmonic_amps(y: np.ndarray, sr: int,
                          f0: np.ndarray, voiced: np.ndarray,
                          n_harmonics: int) -> np.ndarray:
    """
    For each voiced frame, evaluate the STFT magnitude at exactly k·F0 for
    k = 1 … n_harmonics using parabolic interpolation (no peak search).

    Returns
    -------
    amps_db : ndarray, shape (n_frames, n_harmonics)  — dB scale
    """
    D   = librosa.stft(y, n_fft=N_FFT, hop_length=HOP_LENGTH,
                       window="hann", center=True)
    mag = np.abs(D)                                    # (bins, frames)
    n_frames = min(mag.shape[1], len(f0))

    amps_db = np.full((n_frames, n_harmonics), -120.0)

    for fi in range(n_frames):
        if not voiced[fi] or f0[fi] <= 0.0:
            continue
        mag_db = librosa.amplitude_to_db(mag[:, fi], ref=1.0)
        for k in range(1, n_harmonics + 1):
            freq = k * f0[fi]
            if freq >= sr / 2.0:
                break
            bin_f = freq * N_FFT / sr
            amps_db[fi, k - 1] = parabolic_interp_db(mag_db, bin_f)

    return amps_db


def normalise_to_range(amps_db: np.ndarray, voiced: np.ndarray) -> np.ndarray:
    """
    Map dB amplitudes to [AMP_LO, AMP_HI] per frame using min-max scaling.
    Preserves relative harmonic balance within each frame.
    Unvoiced frames remain at 0.
    """
    out = np.zeros_like(amps_db)
    for i in range(len(amps_db)):
        if not voiced[i]:
            continue
        a = amps_db[i]
        lo, hi = a.min(), a.max()
        if hi - lo < 1e-6:
            out[i] = np.full_like(a, (AMP_LO + AMP_HI) / 2.0)
        else:
            out[i] = AMP_LO + (a - lo) / (hi - lo) * (AMP_HI - AMP_LO)
    return out


def smooth_amplitudes(amps: np.ndarray, voiced: np.ndarray) -> np.ndarray:
    """
    One-pole low-pass filter applied per-harmonic across consecutive voiced
    frames.  Filter state resets on unvoiced gaps.
    """
    out  = amps.copy()
    prev = np.zeros(amps.shape[1])
    for i in range(len(amps)):
        if voiced[i]:
            out[i] = AMP_ALPHA * prev + (1.0 - AMP_ALPHA) * amps[i]
            prev   = out[i]
        else:
            prev = np.zeros(amps.shape[1])
    return out


def fill_voiced_gaps(voiced: np.ndarray, f0: np.ndarray,
                     max_gap: int) -> tuple[np.ndarray, np.ndarray]:
    """
    Fill short unvoiced gaps (< max_gap frames) inside voiced regions by
    linear interpolation of F0.  Avoids silencing the middle of sustained notes.
    """
    voiced = voiced.copy()
    f0     = f0.copy()
    n      = len(voiced)
    i      = 0
    while i < n:
        if not voiced[i]:
            # find end of this unvoiced run
            j = i
            while j < n and not voiced[j]:
                j += 1
            gap = j - i
            # fill only if gap is short AND surrounded by voiced frames
            if gap < max_gap and i > 0 and j < n and voiced[i - 1] and voiced[j]:
                voiced[i:j] = True
                # linearly interpolate F0 across the gap
                f0[i:j] = np.linspace(f0[i - 1], f0[j], gap + 2)[1:-1]
            i = j
        else:
            i += 1
    return voiced, f0


def resynthesize(f0: np.ndarray, amps_db: np.ndarray,
                 voiced: np.ndarray, sr: int,
                 hop_length: int, n_harmonics: int) -> np.ndarray:
    """
    Resynthesize audio by summing sine waves at k·F0 with amplitudes derived
    from the extracted dB magnitudes.  Phase continuity is maintained across
    frames; phase resets on unvoiced gaps.
    """
    # dB → linear, clipped to avoid negative-dB artefacts
    amps_lin = librosa.db_to_amplitude(np.clip(amps_db, -120.0, 0.0))

    n_frames  = len(f0)
    n_samples = n_frames * hop_length
    output    = np.zeros(n_samples)
    phases    = np.zeros(n_harmonics)   # per-harmonic phase accumulators

    for fi in range(n_frames):
        start     = fi * hop_length
        end       = min(start + hop_length, n_samples)
        chunk_len = end - start

        if not voiced[fi] or f0[fi] <= 0.0:
            phases[:] = 0.0
            continue

        t         = np.arange(chunk_len, dtype=np.float64)
        frame_out = np.zeros(chunk_len)

        for k in range(n_harmonics):
            freq = (k + 1) * f0[fi]
            if freq >= sr / 2.0:
                break
            phase_inc  = 2.0 * np.pi * freq / sr
            frame_out += float(amps_lin[fi, k]) * np.sin(phases[k] + phase_inc * t)
            phases[k]  = (phases[k] + phase_inc * chunk_len) % (2.0 * np.pi)

        output[start:end] = frame_out

    # peak-normalise to -3 dBFS
    peak = np.max(np.abs(output))
    if peak > 1e-6:
        output = output / peak * 0.707

    return output.astype(np.float32)


# ── main ──────────────────────────────────────────────────────────────────────

def main() -> None:
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    audio_path  = sys.argv[1]
    n_harmonics = int(sys.argv[2]) if len(sys.argv) > 2 else 16
    stem        = os.path.splitext(os.path.basename(audio_path))[0]
    out_path    = sys.argv[3] if len(sys.argv) > 3 \
                  else os.path.join(os.path.dirname(audio_path),
                                    stem + ".txt")

    # ── load audio ────────────────────────────────────────────────────────────
    print(f"Loading  {audio_path}")
    y, sr = librosa.load(audio_path, sr=None, mono=True)
    print(f"         sr={sr} Hz  duration={len(y)/sr:.2f}s")

    # ── F0 estimation (pYIN) ──────────────────────────────────────────────────
    # pYIN needs at least 2 full periods of fmin in the frame
    pyin_frame_length = int(2 ** np.ceil(np.log2(2 * np.ceil(sr / F0_MIN))))
    print(f"pYIN     f0 ∈ [{F0_MIN}, {F0_MAX}] Hz  frame_length={pyin_frame_length} ...")
    f0_raw, voiced_flag, voiced_prob = librosa.pyin(
        y,
        fmin=float(F0_MIN),
        fmax=float(F0_MAX),
        sr=sr,
        hop_length=HOP_LENGTH,
        frame_length=pyin_frame_length,
        fill_na=0.0,
    )

    voiced = (voiced_prob >= VOICED_THRESH) & (f0_raw > 0.0)
    print(f"         voiced frames: {voiced.sum()} / {len(voiced)}"
          f"  ({100*voiced.mean():.1f}%)")

    # median-filter F0 only where voiced (avoids smearing across gaps)
    f0 = f0_raw.copy()
    if voiced.sum() > F0_MED_WIN:
        indices = np.where(voiced)[0]
        f0_voiced_filtered = median_filter(f0[voiced], size=F0_MED_WIN)
        f0[indices] = f0_voiced_filtered

    # fill short unvoiced gaps mid-note
    voiced, f0 = fill_voiced_gaps(voiced, f0, VOICED_GAP_FILL)
    print(f"         after gap-fill: {voiced.sum()} / {len(voiced)}"
          f"  ({100*voiced.mean():.1f}%)")

    # ── harmonic amplitude extraction ─────────────────────────────────────────
    print(f"Harmonics N={n_harmonics}  window={N_FFT}  hop={HOP_LENGTH} ...")
    amps_db     = extract_harmonic_amps(y, sr, f0, voiced, n_harmonics)
    amps_norm   = normalise_to_range(amps_db, voiced)
    amps_smooth = smooth_amplitudes(amps_norm, voiced)

    # ── resynthesis (quality check) ───────────────────────────────────────────
    resynth_path = os.path.join(os.path.dirname(audio_path), stem + "_resynth.wav")
    print(f"Resynthesising ...")
    audio_resynth = resynthesize(f0, amps_db, voiced, sr, HOP_LENGTH, n_harmonics)
    sf.write(resynth_path, audio_resynth, sr)
    print(f"         → {resynth_path}")

    # ── write text output ─────────────────────────────────────────────────────
    # format: time p1 a1 p2 a2 ... pN aN
    # pk = k * f0 (Hz),  ak = normalised amplitude  (0.0 if unvoiced)
    n_frames          = len(f0)
    times             = librosa.frames_to_time(np.arange(n_frames), sr=sr,
                                               hop_length=HOP_LENGTH)
    frame_interval_ms = round(HOP_LENGTH / sr * 1000, 4)

    with open(out_path, "w") as fh:
        # header comment (Max ignores lines starting with #)
        fh.write(f"# audio_file={os.path.basename(audio_path)} "
                 f"sr={sr} n_harmonics={n_harmonics} "
                 f"hop_length={HOP_LENGTH} "
                 f"frame_interval_ms={frame_interval_ms}\n")
        for i in range(n_frames):
            t   = round(float(times[i]), 4)
            row = [t]
            for k in range(1, n_harmonics + 1):
                if voiced[i] and f0[i] > 0.0:
                    pk = round(float(k * f0[i]), 3)
                    ak = round(float(amps_smooth[i, k - 1]), 6)
                else:
                    pk, ak = 0.0, 0.0
                row += [pk, ak]
            fh.write(" ".join(str(v) for v in row) + "\n")

    print(f"\nDone")
    print(f"  Text     → {out_path}")
    print(f"  Resynth  → {resynth_path}")
    print(f"  {n_frames} frames  ({voiced.sum()} voiced)")


if __name__ == "__main__":
    main()
