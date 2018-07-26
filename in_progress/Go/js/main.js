console.log("loaded main.js");

let players = {0: "White", 1: "Black"}

let curr_turn = 0

$( document ).ready(function() {

	$( "#board" ).mousemove(function(event) {
		let mouse_tracker = $("#mouse_tracker");
		let text = "X: " + event.clientX + "  Y: " + event.clientY
		mouse_tracker[0].innerHTML = text;
	});

	$( "#board" ).click(function(event) {
		curr_turn = 1 - curr_turn;
		let turn_tracker = $("#turn_tracker");
		let text = players[curr_turn] + "'s' turn";
		turn_tracker[0].innerHTML = text;
	});

});
