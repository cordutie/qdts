/**
 * qdts.spectrum_view
 *
 * C++ Min-API UI external.
 * Draws the QDTS target and carrier tone spectra as a vertical-line plot.
 *
 * Inlets
 * ------
 *   1  (messages)
 *        carrier_freq <float>   — carrier base frequency in Hz
 *        target_freq  <float>   — target (difference-tone) frequency in Hz
 *        target_amps  <list>    — N target amplitudes  [-2 … 2]
 *        carrier_amps <list>    — N+1 carrier amplitudes [-2 … 2]
 *
 * Drawing
 * -------
 *   Amber lines  — target tones at  k * target_freq,                k = 1 … N
 *   Cyan  lines  — carrier tones at carrier_freq + k * target_freq,  k = 0 … N
 *   Line height encodes amplitude (-2 … 2), zero line is centred vertically.
 */

#ifdef _WIN32
#include <windows.h>
#endif

#include "c74_min.h"
#include "c74_min_graphics.h"

#include <vector>
#include <string>
#include <cmath>
#include <algorithm>

using namespace c74::min;
using namespace c74::min::ui;

// ─────────────────────────────────────────────────────────────────────────────
class spectrum_view : public object<spectrum_view>
                    , public ui_operator<600, 300> {
public:
    MIN_DESCRIPTION { "QDTS spectrum visualizer — draws target and carrier tone spectra." };
    MIN_TAGS        { "ui, graphics, visualization" };
    MIN_AUTHOR      { "Gutierrez, E. and Cadiz, R." };

    // ── Constructor ───────────────────────────────────────────────────────────
    spectrum_view(const atoms& args = {})
        : object<spectrum_view>{}
        , ui_operator<600, 300>{this, args}
        , cf_(440.0)
        , tf_(110.0)
    {}

    // ── Messages ──────────────────────────────────────────────────────────────
    message<> carrier_freq_msg { this, "carrier_freq", MIN_FUNCTION {
        if (!args.empty()) { cf_ = (double)args[0]; redraw(); }
        return {};
    }};

    message<> target_freq_msg { this, "target_freq", MIN_FUNCTION {
        if (!args.empty()) { tf_ = (double)args[0]; redraw(); }
        return {};
    }};

    message<> target_amps_msg { this, "target_amps", MIN_FUNCTION {
        tamps_.clear();
        for (const auto& a : args) tamps_.push_back((double)a);
        redraw();
        return {};
    }};

    message<> carrier_amps_msg { this, "carrier_amps", MIN_FUNCTION {
        camps_.clear();
        for (const auto& a : args) camps_.push_back((double)a);
        redraw();
        return {};
    }};

    attribute<bool> log_scale { this, "log_scale", true,
        description { "When ON, the x-axis uses a logarithmic frequency scale. When OFF, linear." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<double> freq_min { this, "freq_min", 20.0,
        description { "Minimum frequency shown on the x-axis (Hz)." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<double> freq_max { this, "freq_max", 13000.0,
        description { "Maximum frequency shown on the x-axis (Hz)." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    message<> bang_msg { this, "bang", MIN_FUNCTION {
        redraw();
        return {};
    }};

    // ── Paint ─────────────────────────────────────────────────────────────────
    message<> paint { this, "paint", MIN_FUNCTION {
        ui::target t { args };
        auto* g = static_cast<c74::max::t_jgraphics*>(t);
        const double W = t.width();
        const double H = t.height();

        // layout
        const double ML = 38.0, MR = 14.0, MT = 30.0, MB = 60.0;
        const double DW = W - ML - MR;
        const double DH = H - MT - MB;
        const double Z  = MT + DH * 0.5;   // y-pixel for amplitude = 0

        // ── Background ────────────────────────────────────────────────────────
        jgraphics_set_source_jrgba(g, color{0.08, 0.08, 0.11, 1.0});
        jgraphics_rectangle(g, 0, 0, W, H);
        jgraphics_fill(g);

        const int N  = static_cast<int>(tamps_.size());
        const int Nc = static_cast<int>(camps_.size());

        // ── Frequency scale: log or linear, bounds from inspector ────────────
        const double F_MIN = std::max((double)freq_min, 1.0);
        const double F_MAX = std::max((double)freq_max, F_MIN + 1.0);
        const double logMin = std::log10(F_MIN);
        const double logMax = std::log10(F_MAX);

        auto fx = [&](double f) {
            f = std::max(f, F_MIN);
            if (log_scale)
                return ML + ((std::log10(f) - logMin) / (logMax - logMin)) * DW;
            else
                return ML + ((f - F_MIN) / (F_MAX - F_MIN)) * DW;
        };
        auto ay = [&](double a) { return Z  - (a / 2.0) * (DH * 0.5); };

        // ── Amplitude grid ────────────────────────────────────────────────────
        const double grid[] = { 2.0, 1.0, 0.0, -1.0, -2.0 };
        for (double gv : grid) {
            const double gy     = ay(gv);
            const bool   iszero = (gv == 0.0);
            const double gc     = iszero ? 0.32 : 0.16;
            const double gb     = iszero ? 0.40 : 0.22;

            jgraphics_set_source_jrgba(g, color{gc, gc, gb, 1.0});
            jgraphics_set_line_width(g, iszero ? 1.0 : 0.5);
            jgraphics_move_to(g, ML, gy);
            jgraphics_line_to(g, ML + DW, gy);
            jgraphics_stroke(g);

            // y-axis label
            jgraphics_set_source_jrgba(g, color{0.44, 0.44, 0.50, 1.0});
            jgraphics_select_font_face(g, "Arial",
                c74::max::JGRAPHICS_FONT_SLANT_NORMAL,
                c74::max::JGRAPHICS_FONT_WEIGHT_NORMAL);
            jgraphics_set_font_size(g, 9.0);
            jgraphics_move_to(g, 3.0, gy + 3.0);
            std::string lbl = (gv > 0) ? ("+" + std::to_string((int)gv))
                                       : std::to_string((int)gv);
            jgraphics_show_text(g, lbl.c_str());
        }

        if (N == 0 && Nc == 0) return {};

        constexpr double lw = 1.0;
        constexpr double dot_r = 2.0;

        // ── Target tones (amber) — at k * tf_ ────────────────────────────────
        for (int k = 0; k < N; ++k) {
            const double f = (k + 1) * tf_;
            const double a = tamps_[k];
            const double x = fx(f);
            const double y = ay(a);

            jgraphics_set_source_jrgba(g, color{1.0, 0.66, 0.04, 0.88});
            jgraphics_set_line_width(g, lw);
            jgraphics_move_to(g, x, Z);
            jgraphics_line_to(g, x, y);
            jgraphics_stroke(g);

            jgraphics_set_source_jrgba(g, color{1.0, 0.82, 0.32, 1.0});
            jgraphics_arc(g, x, y, dot_r, 0.0, M_PI * 2.0);
            jgraphics_fill(g);

            // freq label — vertical, staggered rows
            const double label_y = (H - MB + 10.0) + (k % 2) * 14.0;
            jgraphics_set_source_jrgba(g, color{1.0, 0.66, 0.04, 0.80});
            jgraphics_set_font_size(g, 8.0);
            jgraphics_save(g);
            jgraphics_translate(g, x + 3.0, label_y);
            jgraphics_rotate(g, -M_PI / 2.0);
            jgraphics_move_to(g, 0.0, 0.0);
            jgraphics_show_text(g, std::to_string((int)std::round(f)).c_str());
            jgraphics_restore(g);
        }

        // ── Carrier tones (cyan) — at cf_ + k * tf_ ──────────────────────────
        for (int k = 0; k < Nc; ++k) {
            const double f = cf_ + k * tf_;
            const double a = camps_[k];
            const double x = fx(f);
            const double y = ay(a);

            jgraphics_set_source_jrgba(g, color{0.09, 0.75, 1.0, 0.88});
            jgraphics_set_line_width(g, lw);
            jgraphics_move_to(g, x, Z);
            jgraphics_line_to(g, x, y);
            jgraphics_stroke(g);

            jgraphics_set_source_jrgba(g, color{0.30, 0.90, 1.0, 1.0});
            jgraphics_arc(g, x, y, dot_r, 0.0, M_PI * 2.0);
            jgraphics_fill(g);

            // freq label — vertical, staggered rows (offset below target labels)
            const double label_y = (H - MB + 32.0) + (k % 2) * 14.0;
            jgraphics_set_source_jrgba(g, color{0.09, 0.75, 1.0, 0.80});
            jgraphics_set_font_size(g, 8.0);
            jgraphics_save(g);
            jgraphics_translate(g, x + 3.0, label_y);
            jgraphics_rotate(g, -M_PI / 2.0);
            jgraphics_move_to(g, 0.0, 0.0);
            jgraphics_show_text(g, std::to_string((int)std::round(f)).c_str());
            jgraphics_restore(g);
        }

        // ── Legend ────────────────────────────────────────────────────────────
        const double lx = ML + 8.0, ly = 8.0;

        jgraphics_set_source_jrgba(g, color{1.0, 0.66, 0.04, 0.9});
        jgraphics_rectangle(g, lx, ly, 14.0, 4.0);
        jgraphics_fill(g);
        jgraphics_set_source_jrgba(g, color{0.82, 0.82, 0.82, 1.0});
        jgraphics_set_font_size(g, 10.0);
        jgraphics_move_to(g, lx + 18.0, ly + 5.0);
        jgraphics_show_text(g, "target   (k x f_target,  k=1..N)");

        jgraphics_set_source_jrgba(g, color{0.09, 0.75, 1.0, 0.9});
        jgraphics_rectangle(g, lx, ly + 14.0, 14.0, 4.0);
        jgraphics_fill(g);
        jgraphics_set_source_jrgba(g, color{0.82, 0.82, 0.82, 1.0});
        jgraphics_move_to(g, lx + 18.0, ly + 19.0);
        jgraphics_show_text(g, "carrier  (f_c + k x f_t,  k=0..N)");

        return {};
    }};

private:
    double cf_;   // carrier frequency
    double tf_;   // target frequency
    std::vector<double> tamps_;   // target amplitudes  (size N)
    std::vector<double> camps_;   // carrier amplitudes (size N+1)
};

MIN_EXTERNAL(spectrum_view);
