#!/usr/bin/env python3
"""
plot_quality.py  —  max/source/benchmarks/

Reads the CSV produced by benchmark_quality and generates two figures:

  Figure 1 (_nn):         qdts.solver_nn only — mean ± std, y ∈ [0, 1]
  Figure 2 (_comparison): qdts.solver vs qdts.solver_nn — mean ± std

Usage:
    python plot_quality.py [input_csv] [output_base]

Defaults:
    input_csv   = results/quality_results.csv
    output_base = results/quality_results_plot
"""

import sys
import os
import csv

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker
from matplotlib.lines   import Line2D
from matplotlib.patches import Patch
from matplotlib.legend_handler import HandlerTuple

# ── load data ─────────────────────────────────────────────────────────────────
script_dir  = os.path.dirname(os.path.abspath(__file__))
input_csv   = sys.argv[1] if len(sys.argv) > 1 \
              else os.path.join(script_dir, "results", "quality_results.csv")
output_base = sys.argv[2] if len(sys.argv) > 2 \
              else os.path.join(script_dir, "results", "quality_results_plot")

Ns              = []
nn_mean         = []
nn_std          = []
solver_mean     = []
solver_std      = []

with open(input_csv, newline="") as f:
    reader = csv.DictReader(f)
    for row in reader:
        Ns.append(int(row["N"]))
        nn_mean.append(float(row["nn_mean_error"]))
        nn_std.append(float(row["nn_std_error"]))
        solver_mean.append(float(row["solver_mean_error"]))
        solver_std.append(float(row["solver_std_error"]))

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

BLUE   = "#2166AC"   # qdts.solver_nn
ORANGE = "#D6604D"   # qdts.solver

def _style_axes(ax, ylim=None):
    ax.set_xlabel(r"Number of Target Harmonics, $N$")
    ax.set_ylabel("Reconstruction Error (MSE)")
    ax.set_xticks(Ns)
    ax.xaxis.set_minor_locator(ticker.NullLocator())
    ax.yaxis.set_minor_locator(ticker.AutoMinorLocator(2))
    ax.grid(axis="y", linestyle="--", linewidth=0.5, alpha=0.55)
    if ylim is not None:
        ax.set_ylim(*ylim)
    else:
        ax.set_ylim(bottom=0)

# ── Figure 1: solver_nn only, y ∈ [0, 1] ─────────────────────────────────────
fig1, ax1 = plt.subplots(figsize=(4.5, 3.0))

lo = [m - s for m, s in zip(nn_mean, nn_std)]
hi = [m + s for m, s in zip(nn_mean, nn_std)]
line_nn, = ax1.plot(Ns, nn_mean, "o-", color=BLUE)
ax1.fill_between(Ns, lo, hi, alpha=0.20, color=BLUE, linewidth=0)

_style_axes(ax1, ylim=(0, 1))

h_nn = (line_nn, Patch(facecolor=BLUE, alpha=0.30, linewidth=0))
ax1.legend(
    [h_nn],
    ["Neural Network Solver"],
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
fig1.savefig(output_base + "_nn.pdf", bbox_inches="tight")
fig1.savefig(output_base + "_nn.png", dpi=300, bbox_inches="tight")
print(f"NN plot        → {output_base}_nn.pdf")
print(f"               → {output_base}_nn.png")

# ── Figure 2: comparison ──────────────────────────────────────────────────────
fig2, ax2 = plt.subplots(figsize=(4.5, 3.0))

lo_s = [m - s for m, s in zip(solver_mean, solver_std)]
hi_s = [m + s for m, s in zip(solver_mean, solver_std)]
line_s, = ax2.plot(Ns, solver_mean, "o-", color=ORANGE)
ax2.fill_between(Ns, lo_s, hi_s, alpha=0.20, color=ORANGE, linewidth=0)

lo_n = [m - s for m, s in zip(nn_mean, nn_std)]
hi_n = [m + s for m, s in zip(nn_mean, nn_std)]
line_n, = ax2.plot(Ns, nn_mean, "s-", color=BLUE)
ax2.fill_between(Ns, lo_n, hi_n, alpha=0.20, color=BLUE, linewidth=0)

_style_axes(ax2)

h_s = (Line2D([0], [0], color=ORANGE, marker="o", linewidth=1.5, markersize=5),
       Patch(facecolor=ORANGE, alpha=0.30, linewidth=0))
h_n = (Line2D([0], [0], color=BLUE,   marker="s", linewidth=1.5, markersize=5),
       Patch(facecolor=BLUE,   alpha=0.30, linewidth=0))
ax2.legend(
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

fig2.tight_layout()
fig2.savefig(output_base + "_comparison.pdf", bbox_inches="tight")
fig2.savefig(output_base + "_comparison.png", dpi=300, bbox_inches="tight")
print(f"Comparison plot → {output_base}_comparison.pdf")
print(f"                → {output_base}_comparison.png")

# ── Figure 3: comparison, log-scale y ────────────────────────────────────────
fig3, ax3 = plt.subplots(figsize=(4.5, 3.0))

ax3.plot(Ns, solver_mean, "o-", color=ORANGE)
ax3.fill_between(Ns, lo_s, hi_s, alpha=0.20, color=ORANGE, linewidth=0)

ax3.plot(Ns, nn_mean, "s-", color=BLUE)
ax3.fill_between(Ns, lo_n, hi_n, alpha=0.20, color=BLUE, linewidth=0)

ax3.set_xlabel(r"Number of Target Harmonics, $N$")
ax3.set_ylabel("Reconstruction Error (MSE)")
ax3.set_xticks(Ns)
ax3.set_yscale("log")
ax3.set_ylim(1e-6, 1e2)
ax3.xaxis.set_minor_locator(ticker.NullLocator())
ax3.yaxis.set_major_formatter(ticker.LogFormatterSciNotation())
ax3.grid(axis="y", linestyle="--", linewidth=0.5, alpha=0.55)

# ── annotate peak of each solver ──────────────────────────────────────────────
nn_peak_idx     = nn_mean.index(max(nn_mean))
solver_peak_idx = solver_mean.index(max(solver_mean))

ax3.annotate(f"{nn_mean[nn_peak_idx]:.2e}",
    xy=(Ns[nn_peak_idx], nn_mean[nn_peak_idx]),
    xytext=(0, 8), textcoords="offset points",
    fontsize=7.5, color=BLUE, ha="center")

ax3.annotate(f"{solver_mean[solver_peak_idx]:.2e}",
    xy=(Ns[solver_peak_idx], solver_mean[solver_peak_idx]),
    xytext=(0, 8), textcoords="offset points",
    fontsize=7.5, color=ORANGE, ha="center")

ax3.legend(
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
    loc="upper right",
)

fig3.tight_layout()
fig3.savefig(output_base + "_comparison_log.pdf", bbox_inches="tight")
fig3.savefig(output_base + "_comparison_log.png", dpi=300, bbox_inches="tight")
print(f"Log comparison  → {output_base}_comparison_log.pdf")
print(f"                → {output_base}_comparison_log.png")
