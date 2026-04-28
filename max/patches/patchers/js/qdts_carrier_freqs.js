// qdts_carrier_freqs.js
// Generates the list of carrier tone frequencies:
//   carrier, carrier+target, carrier+2*target, ..., carrier+16*target
//
// Message inputs
//   carrier <float>  — carrier base frequency in Hz
//   target  <float>  — target (difference-tone) frequency in Hz
//
// Outlet 1: list of 17 floats

outlets = 1;

var cf = 440;
var tf = 110;

function carrier(f) { cf = f; bang(); }
function target(f)  { tf = f; bang(); }

function bang() {
    var freqs = [];
    for (var k = 0; k <= 16; k++) {
        freqs.push(cf + k * tf);
    }
    outlet(0, freqs);
}