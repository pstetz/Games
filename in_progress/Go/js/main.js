console.log("loaded main.js");

$( document ).ready(function() {

	$( "#board" ).mousemove(function(event) {
		let mouse_tracker = $("#mouse_tracker")
		let tracker = "<div>X: " + event.clientX + "  Y: " + event.clientY + "</div>"
		mouse_tracker[0].innerHTML = tracker;
	});

});
