console.log("loaded board.js");

let players = {0: "White", 1: "Black"}

class Board {
	constructor() {
		this.row = 19;
		this.col = 19;
		this.size = 0;
		this.curr = 0;
		this.player = "White";
		this.init_grid();
	}

	place_stone(move) {
		this.change_turns();
		this.size += 1;
	}

	change_turns() {
		this.curr = 1 - this.curr;
		this.player = players[this.curr];
	}

	is_good_move(event) {
		return true;
	}

	init_grid() {
		let grid = new Array(this.row);
		for(let i = 0; i < this.row; i++) {
			let row = new Array(this.col);
			for(let j = 0; j < this.col; j++) {
				row[j] = "Empty";
			}
			grid[i] = row;
		}
		self.grid = grid;
	}

}