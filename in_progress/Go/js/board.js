console.log("loaded board.js");

let players = {0: "White", 1: "Black"}

class Board {
	constructor() {
		this.size = 0;
		this.curr = 0;
		this.player = "White";
		console.log("made board");
	}

	place_stone(move) {
		this.change_turns();
		this.size += 1;
	}

	change_turns() {
		this.curr = 1 - this.curr;
		this.player = players[this.curr];
		console.log(this.curr);
	}

	is_good_move(event) {
		return true;
	}

}