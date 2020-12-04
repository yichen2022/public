// Game must keep track of player's score
export class Player {
	constructor(name) {
		this.name = name;
		this.points = 0;
		this.consecutive_sets = 0;
	}
}

// CPU will randomly make errors depending on difficulty level
// time to answer is also dependent on difficulty level
export class ComputerPlayer extends Player {
	constructor(name, difficulty) {
		super();
		this.name = name;
		this.points = 0;
		this.consecutive_sets = 0;
		this.difficulty = parseInt(difficulty);
		this.answer = [];
		this.wait_time = this.get_wait_time();
	}

	// Determine how long to wait before answering
	get_wait_time() {
		switch(this.difficulty) {
			case 0:
				return 22000;
			case 1:
				return 18000;
			default:
				return 10000;
		}
	}

	// make a correct/incorrect answer depending on difficulty level
	// if no possible answer, make no selection
	make_choice(correct_answer, cards) {
		let odds;
		switch(this.difficulty) {
			case 0:
				odds = 3;
				break;
			case 1:
				odds = 5;
				break;
			default:
				odds = 7;
				break;
		}
		let mistake = Math.floor(Math.random() * odds);
		if (mistake === 0) {
			while (this.answer.length < 3) {
				let random_card = Math.floor(Math.random() * (cards.length - 1));
				if (this.answer.indexOf(random_card) === -1) {
					this.answer.push(random_card);
				}
			}
		}
		else {
			this.answer = correct_answer;
		}

	}
}
