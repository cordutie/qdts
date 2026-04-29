#!/usr/bin/env python3
"""
plot_quality.py  —  max/source/benchmarks/

Reads the CSV produced by benchmark_quality and generates a publication-
quality figure showing reconstruction error (mean ± std, with dashed
min/max lines) over N for qdts.solver_nn.

Usage:
    python plot_quality.py [input_csv] [output_base]

Defaults:
    input_csv   = results/quality_results.csv
    output_base = results/quality_results_plot   (writes .pdf and .png)
"""

import sys
import os
import csv

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.patches import Patch
from matplotlib.legend_handler import HandlerTuple

# ── load data ─────────────────────────────────────────────────────────────────
script_dir  = os.path.dirname(os.path.abspath(__file__))
input_csv   = sys.argv[1] if len(sys.argv) > 1 \
              else os.path.join(script_dir, "results", "quality_results.csv")
output_base = sys.argv[2] if len(sys.argv) > 2 \
              else os.path.join(script_dir, "results", "quality_results_plot")

Ns, mean_err, std_err, min_err, max_err = [], [], [], [], []

with open(input_csv, newline="") as f:
    reader = csv.DictReader(f)
    for row in reader:
        Ns.append(int(row["N"]))
        mean_err.append(float(row["mean_error"]))
        std_err.append(float(row["std_error"]))
        min_err.append(float(row["min_error"]))
        max_err.append(float(row["max_error"]))

# ── style ─────────────────────────────────────────────────────────────────────
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
    "pdf.fonttype":       42,
    "ps.fonttype":        42,
})

BLUE = "#2166AC"

fig, ax = plt.subplots(figsize=(4.5, 3.0))

# ── mean line + std band ──────────────────────────────────────────────────────
lo = [m - s for m, s in zip(mean_err, std_err)]
hi = [m + s for m, s in zip(mean_err, std_err)]
line_mean, = ax.plot(Ns, mean_err, "o-", color=BLUE)
band = ax.fill_between(Ns, lo, hi, alpha=0.20, color=BLUE, linewidth=0)

# ── axes ──────────────────────────────────────────────────────────────────────
ax.set_xlabel(r"Number of Target Harmonics, $N$")
ax.set_ylabel("Reconstruction Error (MSE)")
ax.set_xticks(Ns)
ax.xaxis.set_minor_locator(ticker.NullLocator())
ax.yaxis.set_minor_locator(ticker.AutoMinorLocator(2))
ax.grid(axis="y", linestyle="--", linewidth=0.5, alpha=0.55)
ax.set_ylim(0, 1)

# ── legend ────────────────────────────────────────────────────────────────────
h_mean = (line_mean, Patch(facecolor=BLUE, alpha=0.30, linewidth=0))

ax.legend(
    [h_mean],
    ["qdts.solver_nn"],
    handler_map={tuple: HandlerTuple(ndivide=None, pad=0.6)},
    title=r"mean $\pm$ std (shaded)",
    title_fontsize=9,
    fontsize=9.5,
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
