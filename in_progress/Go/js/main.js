console.log("loaded main.js");

let board = new Board();

$( document ).ready(function() {

	$( "#board" ).mousemove(function(event) {
		let mouse_tracker = $("#mouse_tracker");
		let text = "X: " + event.clientX + "  Y: " + event.clientY
		mouse_tracker[0].innerHTML = text;
	});

	$( "#board" ).click(function(event) {
		if(board.is_good_move(event)) {
			board.place_stone(event);
			$("#turn_tracker")[0].innerHTML = board.player + "'s turn";
		} else {
			alert("Try a different move");
		}
	});

});
