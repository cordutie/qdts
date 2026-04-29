#!/usr/bin/env python3
"""
plot_smoothness.py  —  max/source/benchmarks/

Reads the CSV produced by benchmark_smoothness and generates two publication-
quality figures.  The y-axis represents the normalized output distance:

    r(α) = ‖S_θ(T_α) − S_θ(A)‖ / ‖S_θ(B) − S_θ(A)‖

For a perfectly linear model this equals α, shown as a dashed diagonal.

  Figure 1 (_mean):  mean ± std shaded band
  Figure 2 (_box):   box-and-whisker (precomputed quartile stats)

Both figures have a dual x-axis:
  bottom — interpolation factor α ∈ {0.0, 0.1, …, 1.0}
  top    — interpolation point label  A, I₁, …, I₉, B

Usage:
    python plot_smoothness.py [input_csv] [output_base]

Defaults:
    input_csv   = results/smoothness_results.csv
    output_base = results/smoothness_results_plot
"""

import sys
import os
import csv

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.patches import Patch
from matplotlib.lines   import Line2D
from matplotlib.legend_handler import HandlerTuple

# ── load data ─────────────────────────────────────────────────────────────────
script_dir  = os.path.dirname(os.path.abspath(__file__))
input_csv   = sys.argv[1] if len(sys.argv) > 1 \
              else os.path.join(script_dir, "results", "smoothness_results.csv")
output_base = sys.argv[2] if len(sys.argv) > 2 \
              else os.path.join(script_dir, "results", "smoothness_results_plot")

alphas  = []
mean_v  = []
std_v   = []
q1_v    = []
med_v   = []
q3_v    = []
wlo_v   = []
whi_v   = []

with open(input_csv, newline="") as f:
    reader = csv.DictReader(f)
    for row in reader:
        alphas.append(float(row["t"]))
        mean_v.append(float(row["mean_val"]))
        std_v.append(float(row["std_val"]))
        q1_v.append(float(row["q1_val"]))
        med_v.append(float(row["median_val"]))
        q3_v.append(float(row["q3_val"]))
        wlo_v.append(float(row["whislo_val"]))
        whi_v.append(float(row["whishi_val"]))

top_labels = ["A"] + [f"$I_{{{i}}}$" for i in range(1, len(alphas) - 1)] + ["B"]

# ── shared style ──────────────────────────────────────────────────────────────
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
GRAY = "#888888"

def _add_dual_xaxis(ax):
    """Add top x-axis with point labels (A, I₁…B); bottom shows α values."""
    ax.set_xticks(alphas)
    ax.set_xticklabels([f"{a:.1f}" for a in alphas])
    ax.set_xlabel(r"Interpolation Factor, $\alpha$")

    ax_top = ax.secondary_xaxis("top")
    ax_top.set_xticks(alphas)
    ax_top.set_xticklabels(top_labels)
    ax_top.tick_params(axis="x", length=0)
    return ax_top

def _style_axes(ax):
    ax.set_ylabel("Normalized Output Distance")
    ax.set_xlim(-0.05, 1.05)
    ax.set_ylim(-0.05, 1.05)
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.1))
    ax.xaxis.set_minor_locator(ticker.NullLocator())
    ax.yaxis.set_minor_locator(ticker.NullLocator())
    ax.grid(axis="y", linestyle="--", linewidth=0.5, alpha=0.40)

def _add_diagonal(ax):
    ax.plot([0, 1], [0, 1], "--", color=GRAY, linewidth=1.0, zorder=1)

# ── Figure 1: mean ± std ──────────────────────────────────────────────────────
fig1, ax1 = plt.subplots(figsize=(4.5, 3.2))

_add_diagonal(ax1)

lo = [m - s for m, s in zip(mean_v, std_v)]
hi = [m + s for m, s in zip(mean_v, std_v)]
line_mean, = ax1.plot(alphas, mean_v, "o-", color=BLUE, zorder=3)
ax1.fill_between(alphas, lo, hi, alpha=0.20, color=BLUE, linewidth=0, zorder=2)

_style_axes(ax1)
_add_dual_xaxis(ax1)

h_mean = (line_mean, Patch(facecolor=BLUE, alpha=0.30, linewidth=0))
h_diag = Line2D([0], [0], color=GRAY, linewidth=1.0, linestyle="--")
ax1.legend(
    [h_mean, h_diag],
    ["qdts.solver_nn", "ideal (linear)"],
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

fig1.tight_layout()
fig1.savefig(output_base + "_mean.pdf", bbox_inches="tight")
fig1.savefig(output_base + "_mean.png", dpi=300, bbox_inches="tight")
print(f"Mean plot → {output_base}_mean.pdf")
print(f"          → {output_base}_mean.png")

# ── Figure 2: box-and-whisker ─────────────────────────────────────────────────
fig2, ax2 = plt.subplots(figsize=(4.5, 3.2))

_add_diagonal(ax2)

bxp_stats = [
    {"med": med_v[i], "q1": q1_v[i], "q3": q3_v[i],
     "whislo": wlo_v[i], "whishi": whi_v[i], "fliers": []}
    for i in range(len(alphas))
]

ax2.bxp(
    bxp_stats,
    positions=alphas,
    widths=0.07,
    showfliers=False,
    patch_artist=True,
    zorder=3,
    boxprops    =dict(facecolor=BLUE, alpha=0.30, linewidth=0.8, edgecolor=BLUE),
    medianprops =dict(color=BLUE, linewidth=1.5),
    whiskerprops=dict(color=BLUE, linewidth=0.8),
    capprops    =dict(color=BLUE, linewidth=0.8),
)

_style_axes(ax2)
_add_dual_xaxis(ax2)

h_box  = (Line2D([0], [0], color=BLUE, linewidth=1.5),
          Patch(facecolor=BLUE, alpha=0.30, linewidth=0))
h_diag = Line2D([0], [0], color=GRAY, linewidth=1.0, linestyle="--")
ax2.legend(
    [h_box, h_diag],
    ["qdts.solver_nn", "ideal (linear)"],
    handler_map={tuple: HandlerTuple(ndivide=None, pad=0.6)},
    title="median, IQR, 1.5×IQR",
    title_fontsize=9,
    fontsize=9.5,
    frameon=True,
    framealpha=0.9,
    edgecolor="0.8",
    borderpad=0.7,
    labelspacing=0.5,
    handlelength=2.2,
)

fig2.tight_layout()
fig2.savefig(output_base + "_box.pdf", bbox_inches="tight")
fig2.savefig(output_base + "_box.png", dpi=300, bbox_inches="tight")
print(f"Box  plot → {output_base}_box.pdf")
print(f"          → {output_base}_box.png")
