#!/usr/bin/env python3
"""
plot_comparison.py  —  max/source/benchmarks/

Reads the CSV produced by benchmark_comparison and generates a publication-
quality figure showing mean computation time ± 1 std over N for both solvers.

Usage:
    python plot_comparison.py [input_csv] [output_base]

Defaults:
    input_csv   = results/comparison_results.csv
    output_base = results/comparison_results_plot   (writes .pdf and .png)
"""

import sys
import os
import csv

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.lines import Line2D
from matplotlib.patches import Patch
from matplotlib.legend_handler import HandlerTuple

# ── load data ─────────────────────────────────────────────────────────────────
script_dir  = os.path.dirname(os.path.abspath(__file__))
input_csv   = sys.argv[1] if len(sys.argv) > 1 \
              else os.path.join(script_dir, "results", "comparison_results.csv")
output_base = sys.argv[2] if len(sys.argv) > 2 \
              else os.path.join(script_dir, "results", "comparison_results_plot")

Ns, solver_mean, solver_std, nn_mean, nn_std = [], [], [], [], []

with open(input_csv, newline="") as f:
    reader = csv.DictReader(f)
    for row in reader:
        Ns.append(int(row["N"]))
        solver_mean.append(float(row["solver_mean_ms"]))
        solver_std.append(float(row["solver_std_ms"]))
        nn_mean.append(float(row["solver_nn_mean_ms"]))
        nn_std.append(float(row["solver_nn_std_ms"]))

# ── style — Times New Roman, conference-paper sizing ─────────────────────────
plt.rcParams.update({
    "font.family":        "serif",
    "font.serif":         ["Times New Roman", "Times", "DejaVu Serif"],
    "font.size":          9,
    "axes.labelsize":     10,
    "axes.titlesize":     10,
    "legend.fontsize":    9.5,
    "xtick.labelsize":    8.5,
    "ytick.labelsize":    8.5,
    "axes.linewidth":     0.8,
    "xtick.major.width":  0.8,
    "ytick.major.width":  0.8,
    "lines.linewidth":    1.5,
    "lines.markersize":   4.5,
    "figure.dpi":         150,
    # embed fonts as TrueType (Type 42) — required by most venues
    "pdf.fonttype":       42,
    "ps.fonttype":        42,
})

ORANGE = "#D6604D"   # qdts.solver
BLUE   = "#2166AC"   # qdts.solver_nn  (matches plot_quality.py)

fig, ax = plt.subplots(figsize=(4.5, 3.0))

# ── plot lines + shaded std bands ─────────────────────────────────────────────
lo_s = [m - s for m, s in zip(solver_mean, solver_std)]
hi_s = [m + s for m, s in zip(solver_mean, solver_std)]
line_s, = ax.plot(Ns, solver_mean, "o-", color=ORANGE)
band_s  = ax.fill_between(Ns, lo_s, hi_s, alpha=0.20, color=ORANGE, linewidth=0)

lo_n = [m - s for m, s in zip(nn_mean, nn_std)]
hi_n = [m + s for m, s in zip(nn_mean, nn_std)]
line_n, = ax.plot(Ns, nn_mean, "s-", color=BLUE)
band_n  = ax.fill_between(Ns, lo_n, hi_n, alpha=0.20, color=BLUE, linewidth=0)

# ── axes ──────────────────────────────────────────────────────────────────────
ax.set_xlabel(r"Number of Target Harmonics, $N$")
ax.set_ylabel("Computation Time (ms)")
ax.set_xticks(Ns)
ax.xaxis.set_minor_locator(ticker.NullLocator())
ax.yaxis.set_minor_locator(ticker.AutoMinorLocator(2))
ax.grid(axis="y", linestyle="--", linewidth=0.5, alpha=0.55)
ax.set_ylim(bottom=0)

# ── legend ────────────────────────────────────────────────────────────────────
# Each entry: line+marker paired with a filled patch; title explains shading
h_s = (Line2D([0], [0], color=ORANGE, marker="o", linewidth=1.5, markersize=5),
       Patch(facecolor=ORANGE, alpha=0.30, linewidth=0))
h_n = (Line2D([0], [0], color=BLUE,   marker="s", linewidth=1.5, markersize=5),
       Patch(facecolor=BLUE,   alpha=0.30, linewidth=0))

ax.legend(
    [h_s, h_n],
    ["Newton-Raphson Solver", "Neural Network Solver"],
    handler_map={tuple: HandlerTuple(ndivide=None, pad=0.6)},
    title=r"mean $\pm$ std (shaded)",
    title_fontsize=9,
    fontsize=10,
    frameon=True,
    framealpha=0.9,
    edgecolor="0.8",
    borderpad=0.7,
    labelspacing=0.5,
    handlelength=2.2,
)

fig.tight_layout()

pdf_path = output_base + ".pdf"
png_path = output_base + ".png"
fig.savefig(pdf_path, bbox_inches="tight")
fig.savefig(png_path, dpi=300, bbox_inches="tight")
print(f"Plot saved → {pdf_path}")
print(f"           → {png_path}")
