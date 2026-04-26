// visual_feedback_linked_sliders.js
//
// draws a transparent black panel over non-interactive sliders 
//   to provide visual feedback to user, that the highlighted 
//   sliders are only interactive via the f0 slider

function msg_int(n)
{
    var panel = this.patcher.getnamed("inactive_area");
    var h1    = this.patcher.getnamed("h1");
    var hN    = this.patcher.getnamed("h" + (n-1));

    if (!panel || !h1 || !hN) return;

    var r1 = h1.getattr("presentation_rect");
    var rN = hN.getattr("presentation_rect");
		

    if (!r1 || !rN) return;

    var x = r1[0];
    var y = r1[1];
    var width  = (rN[0] + rN[2]) - r1[0];
    var height = (rN[1] + rN[3]) - r1[1];

    // panel.presentation_rect = [x, y, width, height]; <-- works only in Max 9
	panel.setattr("presentation_rect", [x, y, width, height]);

}