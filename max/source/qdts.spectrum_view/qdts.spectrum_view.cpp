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
        description { "Maximum frequency shown on the x-axis (Hz). Used when dynamic_freq_range is off." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<bool> dynamic_freq_range { this, "dynamic_freq_range", true,
        description { "When ON, x-axis max is set to carrier + (N+2) * target for maximum visibility." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<color> bgcolor { this, "bgcolor", color{0.08, 0.08, 0.11, 1.0},
        description { "Background color." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<color> textcolor { this, "textcolor", color{0.44, 0.44, 0.50, 1.0},
        description { "Color for grid lines, axis labels, and legend text." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<color> targetcolor { this, "targetcolor", color{1.0, 0.66, 0.04, 1.0},
        description { "Color for target tones." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<color> carriercolor { this, "carriercolor", color{0.09, 0.75, 1.0, 1.0},
        description { "Color for carrier tones." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };

    attribute<double> fontsize { this, "fontsize", 8.0,
        description { "Font size for frequency labels and legend text." },
        setter { MIN_FUNCTION { redraw(); return args; } }
    };


    message<> bang_msg { this, "bang", MIN_FUNCTION {
        redraw();
        return {};
    }};

    // ── Mouse ─────────────────────────────────────────────────────────────────
    message<> mousemove { this, "mousemove", MIN_FUNCTION {
        event e { args };
        mx_ = e.x();
        my_ = e.y();
        hover_active_ = true;
        redraw();
        return {};
    }};

    message<> mouseleave { this, "mouseleave", MIN_FUNCTION {
        hover_active_ = false;
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
        const double ML = 38.0, MR = 14.0, MT = 30.0, MB = 28.0;
        const double DW = W - ML - MR;
        const double DH = H - MT - MB;
        const double Z  = MT + DH * 0.5;   // y-pixel for amplitude = 0

        // ── Resolved colors (attribute<color> → local color for jgraphics) ──
        color c_bg      = bgcolor;
        color c_text    = textcolor;
        color c_target  = targetcolor;
        color c_carrier = carriercolor;

        // ── Background ────────────────────────────────────────────────────────
        jgraphics_set_source_jrgba(g, c_bg);
        jgraphics_rectangle(g, 0, 0, W, H);
        jgraphics_fill(g);

        const int N  = static_cast<int>(tamps_.size());
        const int Nc = static_cast<int>(camps_.size());

        // ── Live scale (used when break not active) ───────────────────────────
        const double F_MIN_live = std::max((double)freq_min, 1.0);
        const double F_MAX_live = [&]() -> double {
            if (dynamic_freq_range && (N > 0 || Nc > 0)) {
                const int n = std::max(N, Nc > 0 ? Nc - 1 : 0);
                return std::max(cf_ + (n + 2) * tf_, F_MIN_live + 1.0);
            }
            return std::max((double)freq_max, F_MIN_live + 1.0);
        }();

        // ── Break detection ───────────────────────────────────────────────────
        const double target_max_f  = (N  > 0) ? N  * tf_ : 0.0;
        const double carrier_min_f = (Nc > 0) ? cf_       : 0.0;
        const double gap_f         = carrier_min_f - target_max_f;
        const bool should_break    = (N > 0) && (Nc > 0)
                                  && (carrier_min_f > target_max_f)
                                  && (gap_f > cf_ * 0.5);

        if (should_break && !break_active_) {
            // Freeze everything that determines dot x-positions
            frozen_cf_        = cf_;
            frozen_tf_        = tf_;
            frozen_fmin_      = F_MIN_live;
            frozen_fmax_      = F_MAX_live;
            frozen_gap_mid_f_ = (target_max_f + carrier_min_f) * 0.5;
            break_active_     = true;
        } else if (!should_break) {
            break_active_ = false;
        }

        const bool use_break = break_active_;

        // Position params: frozen when break active, live otherwise.
        // Labels always use live cf_/tf_ so text updates without moving dots.
        const double pos_fmin = use_break ? frozen_fmin_ : F_MIN_live;
        const double pos_fmax = use_break ? frozen_fmax_ : F_MAX_live;
        const double pos_cf   = use_break ? frozen_cf_   : cf_;
        const double pos_tf   = use_break ? frozen_tf_   : tf_;

        auto fx = [&](double f) {
            f = std::max(f, pos_fmin);
            if (log_scale) {
                const double lf  = std::log10(f);
                const double llo = std::log10(std::max(pos_fmin, 1.0));
                const double lhi = std::log10(std::max(pos_fmax, 2.0));
                return ML + (lf - llo) / (lhi - llo) * DW;
            }
            return ML + (f - pos_fmin) / (pos_fmax - pos_fmin) * DW;
        };
        auto ay = [&](double a) { return Z - (a / 2.0) * (DH * 0.5); };

        // Zigzag anchor: frozen gap midpoint frequency mapped through frozen fx()
        const double gap_mid_x = use_break ? fx(frozen_gap_mid_f_) : 0.0;
        constexpr double BW = 18.0;   // half-width of zigzag strip each side

        // ── Amplitude grid ────────────────────────────────────────────────────
        const double grid[] = { 2.0, 1.0, 0.0, -1.0, -2.0 };
        for (double gv : grid) {
            const double gy    = ay(gv);
            const bool iszero  = (gv == 0.0);
            const double alpha = iszero ? 0.55 : 0.28;
            color c_grid { c_text.red(), c_text.green(), c_text.blue(), alpha };
            jgraphics_set_source_jrgba(g, c_grid);
            jgraphics_set_line_width(g, iszero ? 1.0 : 0.5);
            jgraphics_move_to(g, ML, gy);
            jgraphics_line_to(g, ML + DW, gy);
            jgraphics_stroke(g);

            // y-axis label
            jgraphics_set_source_jrgba(g, c_text);
            jgraphics_select_font_face(g, "Arial",
                c74::max::JGRAPHICS_FONT_SLANT_NORMAL,
                c74::max::JGRAPHICS_FONT_WEIGHT_NORMAL);
            jgraphics_set_font_size(g, fontsize);
            jgraphics_move_to(g, 3.0, gy + 3.0);
            std::string lbl = (gv > 0) ? ("+" + std::to_string((int)gv))
                                       : std::to_string((int)gv);
            jgraphics_show_text(g, lbl.c_str());
        }

        // ── Axis-break zigzag (cosmetic, drawn over the zero line) ───────────
        if (use_break) {
            const int    teeth = 4;
            const double amp   = 2.5;
            const double x0    = gap_mid_x - BW;
            const double x1    = gap_mid_x + BW;
            const double step  = (x1 - x0) / (teeth * 2);

            // blank strip over the zero line
            jgraphics_set_source_jrgba(g, c_bg);
            jgraphics_rectangle(g, x0, Z - amp - 1.0, x1 - x0, (amp + 1.0) * 2.0);
            jgraphics_fill(g);

            // draw squiggle
            color c_squig { c_text.red(), c_text.green(), c_text.blue(), 0.6 };
            jgraphics_set_source_jrgba(g, c_squig);
            jgraphics_set_line_width(g, 1.0);
            jgraphics_move_to(g, x0, Z);
            for (int i = 0; i < teeth * 2; ++i) {
                const double tx = x0 + (i + 1) * step;
                const double ty = Z  + ((i % 2 == 0) ? -amp : amp);
                jgraphics_line_to(g, tx, ty);
            }
            jgraphics_line_to(g, x1, Z);
            jgraphics_stroke(g);
        }

        if (N == 0 && Nc == 0) return {};

        constexpr double lw = 1.0;
        constexpr double dot_r = 2.0;

        struct FreqLabel { double x, r, g, b; std::string text; };
        std::vector<FreqLabel> freq_labels;

        // ── Target tones (amber) ─────────────────────────────────────────────
        // x-position uses pos_tf (frozen when break active)
        // label text uses live tf_ so it updates without moving the dot
        for (int k = 0; k < N; ++k) {
            const double x = fx((k + 1) * pos_tf);   // frozen position
            const double a = tamps_[k];
            const double y = ay(a);

            { color c { c_target.red(), c_target.green(), c_target.blue(), 0.88 }; jgraphics_set_source_jrgba(g, c); }
            jgraphics_set_line_width(g, lw);
            jgraphics_move_to(g, x, Z);
            jgraphics_line_to(g, x, y);
            jgraphics_stroke(g);

            jgraphics_set_source_jrgba(g, c_target);
            jgraphics_arc(g, x, y, dot_r, 0.0, M_PI * 2.0);
            jgraphics_fill(g);

            const double label_f = (k + 1) * tf_;   // live frequency for label text
            const bool near = hover_active_ && ((mx_-x)*(mx_-x)+(my_-y)*(my_-y) < 15.0*15.0);
            if (k == 0 || near)
                freq_labels.push_back({ x, c_target.red(), c_target.green(), c_target.blue(),
                                        std::to_string((int)std::round(label_f)) });
        }

        // ── Carrier tones (cyan) ──────────────────────────────────────────────
        // x-position uses pos_cf/pos_tf (frozen when break active)
        // label text uses live cf_/tf_
        for (int k = 0; k < Nc; ++k) {
            const double x = fx(pos_cf + k * pos_tf);   // frozen position
            const double a = camps_[k];
            const double y = ay(a);

            { color c { c_carrier.red(), c_carrier.green(), c_carrier.blue(), 0.88 }; jgraphics_set_source_jrgba(g, c); }
            jgraphics_set_line_width(g, lw);
            jgraphics_move_to(g, x, Z);
            jgraphics_line_to(g, x, y);
            jgraphics_stroke(g);

            jgraphics_set_source_jrgba(g, c_carrier);
            jgraphics_arc(g, x, y, dot_r, 0.0, M_PI * 2.0);
            jgraphics_fill(g);

            const double label_f = cf_ + k * tf_;   // live frequency for label text
            const bool near = hover_active_ && ((mx_-x)*(mx_-x)+(my_-y)*(my_-y) < 15.0*15.0);
            if (k == 0 || near)
                freq_labels.push_back({ x, c_carrier.red(), c_carrier.green(), c_carrier.blue(),
                                        std::to_string((int)std::round(label_f)) });
        }

        // ── Frequency labels — same row, bump to next row only on overlap ─────
        std::sort(freq_labels.begin(), freq_labels.end(),
                  [](const FreqLabel& a, const FreqLabel& b){ return a.x < b.x; });

        const double fs       = fontsize;
        const double base_y   = H - MB + fs + 4.0;
        const double row_h    = fs + 1.0;
        const double char_w   = fs * 0.62;   // approximate monospace char width

        std::vector<double> row_right(4, -1e9);   // right edge of last label per row
        jgraphics_set_font_size(g, fs);
        for (auto& lbl : freq_labels) {
            const double lbl_w = lbl.text.size() * char_w;
            double draw_x = lbl.x - lbl_w * 0.5;
            int row = 0;
            while (row < (int)row_right.size() && draw_x < row_right[row] + 4.0)
                ++row;
            if (row >= (int)row_right.size()) row = (int)row_right.size() - 1;
            row_right[row] = draw_x + lbl_w;
            color lc { lbl.r, lbl.g, lbl.b, 1.0 };
            jgraphics_set_source_jrgba(g, lc);
            jgraphics_move_to(g, draw_x, base_y + row * row_h);
            jgraphics_show_text(g, lbl.text.c_str());
        }

        // ── Legend (single line) ──────────────────────────────────────────────
        const double lx = ML + 8.0, ly = 14.0;
        jgraphics_set_font_size(g, fontsize);

        // target swatch + label
        jgraphics_set_source_jrgba(g, c_target);
        jgraphics_rectangle(g, lx, ly - 4.0, 10.0, 4.0);
        jgraphics_fill(g);
        jgraphics_move_to(g, lx + 14.0, ly);
        jgraphics_show_text(g, "Target");

        // carrier swatch + label
        const double cx = lx + 110.0;
        jgraphics_set_source_jrgba(g, c_carrier);
        jgraphics_rectangle(g, cx, ly - 4.0, 10.0, 4.0);
        jgraphics_fill(g);
        jgraphics_move_to(g, cx + 14.0, ly);
        jgraphics_show_text(g, "Carrier");

        return {};
    }};

private:
    double cf_;   // carrier frequency
    double tf_;   // target frequency
    std::vector<double> tamps_;   // target amplitudes  (size N)
    std::vector<double> camps_;   // carrier amplitudes (size N+1)
    double mx_ { 0.0 };
    double my_ { 0.0 };
    bool   hover_active_ { false };
    bool   break_active_     { false };
    double frozen_cf_        { 0.0 };
    double frozen_tf_        { 0.0 };
    double frozen_fmin_      { 0.0 };
    double frozen_fmax_      { 0.0 };
    double frozen_gap_mid_f_ { 0.0 };
};

MIN_EXTERNAL(spectrum_view);
