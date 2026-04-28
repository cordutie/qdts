// synth_input_parser.js
// Formats lists of freqs, amps and phases into messages for the synth gen patch
// 
// Message inputs
//   amps list
//   freqs list
//   phases list
//
// Outlet:
//   ai amps[i] or fi freqs[i] or pi phases[i]

outlets = 1;

function freqs() {
    var args = arrayfromargs(arguments);
    for (var i = 0; i < args.length; i++)
        outlet(0, "f" + i, args[i]);
}
function amps() {
    var args = arrayfromargs(arguments);
    for (var i = 0; i < args.length; i++)
        outlet(0, "a" + i, args[i]);
}
function phases() {
    var args = arrayfromargs(arguments);
    for (var i = 0; i < args.length; i++)
        outlet(0, "p" + i, args[i]);
}