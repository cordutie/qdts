/**
 * qdts_player.js — Max JS object for streaming QDTS analysis data
 *
 * Inlets:  1
 * Outlets: 0 = f0 in Hz  (0.0 on unvoiced frames)
 *          1 = amplitudes list  a1 a2 ... aN  (all 0.0 on unvoiced)
 *          2 = current time in ms
 *
 * Messages:
 *   path <filepath>   load a .txt analysis file
 *   play              start playback from the beginning
 *   stop              stop playback and rewind to start
 */

inlets  = 1;
outlets = 3;

var frames          = [];     // [{f0, amps}]
var frameIntervalMs = 10.0;
var currentFrame    = 0;
var playTask        = null;

// ── file loading ──────────────────────────────────────────────────────────────

var rawLines = [];   // kept for debug inspection

function path() {
    var filepath = arrayfromargs(arguments).join(" ");

    _stopTask();
    frames          = [];
    rawLines        = [];
    frameIntervalMs = 10.0;
    currentFrame    = 0;

    var f = new File(filepath, "read", "TEXT");
    if (!f.isopen) {
        post("qdts_player: cannot open '" + filepath + "'\n");
        return;
    }

    // read in chunks — do NOT use f.eof (it is a function in Max 8 V8, always
    // truthy, so any eof check breaks the loop immediately).
    // readstring() returns "" once the file pointer is past the end.
    var content = "";
    for (var ci = 0; ci < 100000; ci++) {
        var chunk = f.readstring(32768);
        var s = chunk ? String(chunk) : "";
        if (s.length === 0) break;
        content += s;
    }
    f.close();

    rawLines = String(content).split("\n");
    post("qdts_player: read " + rawLines.length + " raw lines\n");

    // ── parse ─────────────────────────────────────────────────────────────────
    for (var i = 0; i < rawLines.length; i++) {
        var line = rawLines[i].replace(/\r/g, "").trim();
        if (!line) continue;

        if (line.charAt(0) === "#") {
            var m = line.match(/frame_interval_ms=([\d.]+)/);
            if (m) frameIntervalMs = parseFloat(m[1]);
        } else {
            var parts = line.split(" ");
            var vals  = [];
            for (var j = 0; j < parts.length; j++) {
                if (parts[j].length > 0) vals.push(parseFloat(parts[j]));
            }
            if (vals.length >= 3) {
                var f0   = vals[1];
                var amps = [];
                for (var k = 2; k < vals.length; k += 2) amps.push(vals[k]);
                frames.push({ f0: f0, amps: amps });
            }
        }
    }

    post("qdts_player: loaded " + frames.length + " frames"
         + " @ " + frameIntervalMs + " ms/frame\n");
}

// send 'debug' to post the first 3 raw lines so you can see what Max read
function debug() {
    post("qdts_player debug — rawLines.length=" + rawLines.length + "\n");
    for (var i = 0; i < Math.min(3, rawLines.length); i++) {
        var r = rawLines[i];
        post("  [" + i + "] type=" + typeof r
             + " len=" + (r ? String(r).length : "null")
             + " val='" + r + "'\n");
    }
}

// ── playback ──────────────────────────────────────────────────────────────────

function play() {
    if (!frames.length) {
        post("qdts_player: no file loaded — send 'path <file>'\n");
        return;
    }
    _stopTask();
    currentFrame      = 0;
    playTask          = new Task(tick, this);
    playTask.interval = frameIntervalMs;
    playTask.repeat();
}

function tick() {
    if (currentFrame >= frames.length) {
        _stopTask();
        currentFrame = 0;
        _sendZeros();
        return;
    }

    var fr = frames[currentFrame++];

    outlet(2, (currentFrame - 1) * frameIntervalMs);   // current time in ms
    outlet(1, fr.amps);   // amplitudes (right-to-left in Max)
    outlet(0, fr.f0);
}

function stop() {
    _stopTask();
    currentFrame = 0;
    _sendZeros();
}

function _sendZeros() {
    var n    = frames.length ? frames[0].amps.length : 0;
    var zeros = [];
    for (var i = 0; i < n; i++) zeros.push(0.0);
    outlet(2, 0.0);
    outlet(1, zeros);
    outlet(0, 0.0);
}

function _stopTask() {
    if (playTask) {
        playTask.cancel();
        playTask = null;
    }
}
