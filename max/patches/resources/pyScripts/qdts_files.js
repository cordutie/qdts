/**
 * qdts_files.js — scans a folder for QDTS analysis file sets
 *
 * Inlets:  1
 * Outlets: 0 = original .wav path  (full)
 *          1 = resynth  .wav path  (full)
 *          2 = analysis .txt path  (full)
 *
 * Messages:
 *   bang / scan       scan folder, post found stems, output name list from outlet 0
 *   select <stem>     output the three paths for that stem
 *   path <dir>        change the folder (optional; default hard-coded below)
 */

inlets  = 1;
outlets = 3;

var basePath = "/Users/bezha/Github/qdts/max/patches/resources/pyScripts/";
var stems    = [];

// ── folder scan ───────────────────────────────────────────────────────────────

function bang() { scan(); }

function scan() {
    stems = [];

    var folder = new Folder(basePath);
    for (var safety = 0; safety < 100000; safety++) {
        if (folder.end) break;
        var name = String(folder.filename);
        // collect only original wavs — skip anything ending in _resynth.wav
        if (/\.wav$/i.test(name) && !/_resynth\.wav$/i.test(name)) {
            stems.push(name.replace(/\.wav$/i, ""));
        }
        folder.next();
    }

    post("qdts_files: " + stems.length + " file(s) in " + basePath + "\n");
    for (var i = 0; i < stems.length; i++) post("  [" + i + "] " + stems[i] + "\n");

    // output stem names as a list so a umenu can be populated
    outlet(0, stems);
}

// ── selection ─────────────────────────────────────────────────────────────────

function select(name) {
    var stem = String(name).replace(/\.wav$/i, "");
    outlet(2, basePath + stem + ".txt");
    outlet(1, basePath + stem + "_resynth.wav");
    outlet(0, basePath + stem + ".wav");
}

// ── path override ─────────────────────────────────────────────────────────────

function path() {
    var p = arrayfromargs(arguments).join(" ");
    // ensure trailing slash
    basePath = p.replace(/\/?$/, "/");
    post("qdts_files: base path set to " + basePath + "\n");
}
