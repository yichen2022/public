import Game from './game.js'
import Stats from './stats.js'

// declare global variables that will be used throughout game

// create game instance
let game = new Game();
//create stats instance
let stats = new Stats();
// array of selected_cards (used by cpu to make answers)
let selected_cards = [];
// cpu answers dependent on timeout function (if user is too slow cpu answers
// and the timer is reset)
let cpu_ans;
// track how many hints have been given to user
let hint_num = 0;

// load pregame board, allow user to select difficulty,
// implement start game button
// show lifetime stats
window.onload = function() {
	let board = document.getElementById("game");
	board.style.display = "none";
	let post = document.getElementById("postgame");
	post.style.display = "none";
	let pre = document.getElementById("pregame");
	pre.style.display = "block";
	let begin = document.getElementById("start_game");
	begin.addEventListener('click', () => start_game(), false);
	begin.addEventListener('click', () => 	Stats.count_num_games(stats.stats_map), false);
	display_stats();
}


// show game board and add event listeners to cards
// display cards with show_cards
// implement reshuffle and hint buttons
function start_game() {
	let board = document.getElementById("game");
	board.style.display = "block";
	let pre = document.getElementById("pregame");
	pre.style.display = "none";


	game.add_player("user");
	add_cpu();

	game.deal(stats.stats_map);

	let current_cards = document.getElementsByClassName("card");
	for (let i = 0; i < current_cards.length; i++) {
		current_cards[i].addEventListener('click',() => select_card(current_cards[i],parseInt(current_cards[i].id)),false);
	}


	show_cards();

	let reshuffle_btn = document.getElementById("reshuffle");
	reshuffle_btn.addEventListener('click', () => game.reshuffle(stats.stats_map), false);
	reshuffle_btn.addEventListener('click', () => show_cards(), false);

	let hint_btn = document.getElementById("hint");
	hint_btn.addEventListener('click', () => print_hint(), false);
}


// take updated active_cards array and use the data
// to display the updated cards to the DOM
// if the game is over, call end_game to display
// end game screen, if not, restart the cpu answer timer
function show_cards() {
	reset();
	selected_cards = [];
	let table = document.getElementById("active_cards");
	let i = 0;
	for (let row = 0; row < 3; row++) {
		for (let column = 0; column < 4; column++) {
			if (i < 12 && i >= game.active_cards.length) {
				table.rows[row].cells[column].style.visibility = "hidden";
				table.rows[row].cells[column].innerHTML = "";
				i++;
			}
			else if (i === 12) {
				return;
			}
			else {
				let card_number = game.active_cards[i].index;
				let image = '<img src="assets/'.concat(card_number.toString(), '.png">');
				table.rows[row].cells[column].style.visibility = "visible";
				table.rows[row].cells[column].innerHTML = image;
				i++;
			}

		}
	}
	hint_num = 0;
	if (!game.any_set()) {
		end_game();
	}
	else {
		prepare_answer(game.array_of_player[1].wait_time);
	}
}


// if the game is over, calculate average stats
// show only the endgame screen with corresponding
// words of support/sorrow
function end_game() {
	 Stats.chance_of_no_set(stats.stats_map);
	 Stats.avg_accuracy(stats.stats_map);
	 Stats.write_stats(stats.stats_map);

	 let board = document.getElementById("game");
	 board.style.display = "none";
	 let post = document.getElementById("postgame");
	 post.style.display = "block";

	 let end_game_message = document.getElementById("end_game_message");

	 if (game.array_of_player[0].points > game.array_of_player[1].points ) {
		 end_game_message.innerText = "Congratulations! You've Won!!";
		 end_game_message.style.color = "darkgoldenrod";
	 }
	 else if (game.array_of_player[0].points  < game.array_of_player[1].points ) {
		 end_game_message.innerText = "Sorry! You Lose!";
		 end_game_message.style.color = "darkred";
	 }
	 else {
		 end_game_message.innerText = "It's a Tie!";
		 end_game_message.style.color = "saddlebrown";
	 }
}

// add cpu player to game dependent on user selected difficulty level
function add_cpu() {
	if (document.getElementById("easy").checked) {
		game.add_cpu_player("cpu", 0);
	}
	else if (document.getElementById("medium").checked) {
		game.add_cpu_player("cpu", 1);
	}
	else {
		game.add_cpu_player("cpu", 2);
	}
}

// highlight user selected card or un-highlight if already selected
// if three cards are selected, check if set and update user score
// alert screen of change in score
// if a set was found, update DOM with new cards via show_cards
function select_card(el, i) {
	let select = selected_cards.indexOf(i);

	if (select >= 0) {
		selected_cards.splice(select, 1);
		el.style.border = "5px solid #bfbfbf";
	}
	else if (select < 0) {
		if (selected_cards.length < 3) {
			selected_cards.push(i);
			el.style.border = "5px solid black";
		}
		if (selected_cards.length === 3) {
			if (game.set_checker(selected_cards[0], selected_cards[1], selected_cards[2], game.array_of_player[0], stats.stats_map)) {
				let correct_string = "That set was correct!\n";
				correct_string = correct_string + game.array_of_player[0].name + ": " +
          game.array_of_player[0].points + " CPU: " + game.array_of_player[1].points;
				alert(correct_string);
			  show_cards();
			} else {
				let wrong_string = "Sorry, that was not a set\n";
				wrong_string = wrong_string + game.array_of_player[0].name + ": " +
					game.array_of_player[0].points + " CPU: " + game.array_of_player[1].points;
				alert(wrong_string);
			}
			let current_cards = document.getElementsByClassName("card");
			for (let i = 0; i < current_cards.length; i++) {
				current_cards[i].style.border = "5px solid #bfbfbf";
			}
			selected_cards = [];
		}
	}
}


// Same as above, but the cpu first unselects all cards (in case
// user has 1 or 2 card selected. Then make a choice and add those cards
// to the selected_cards array and update the dom if need be
function cpu_select_cards() {

	let answer_if_exists = game.find_set();
	game.array_of_player[1].make_choice(answer_if_exists, game.active_cards);

	if (game.array_of_player[1].answer.length > 0) {

		// get all cards and unselect them if user has any selected
		let current_cards = document.getElementsByClassName("card");

		if (selected_cards.length > 0) {
			for (let i = 0; i < current_cards.length; i++) {
					selected_cards.splice(i, 1);
					current_cards[i].style.border = "5px solid #bfbfbf";
			}
		}
		// stylize cards and add to selected_cards
		for (let i = 0; i < game.array_of_player[1].answer.length; i++) {
			selected_cards.push(game.array_of_player[1].answer[i]);
			current_cards[game.array_of_player[1].answer[i]].style.border = "5px solid black";
		}

		if (game.set_checker(selected_cards[0], selected_cards[1], selected_cards[2], game.array_of_player[1], stats.stats_map)) {
			let correct_string = "The CPU guessed a set!\n";
			correct_string = correct_string + game.array_of_player[0].name + ": " +
				game.array_of_player[0].points + " CPU: " + game.array_of_player[1].points;
			alert(correct_string);
			show_cards();
		} else {
			let wrong_string = "The CPU guessed wrong!\n";
			wrong_string = wrong_string + game.array_of_player[0].name + ": " +
				game.array_of_player[0].points + " CPU: " + game.array_of_player[1].points;
			alert(wrong_string);
		}

		for (let i = 0; i < current_cards.length; i++) {
			current_cards[i].style.border = "5px solid #bfbfbf";
		}

		selected_cards = [];
	}
}

// start a countdown until the cpu attempts to answer
function prepare_answer(time) {
	cpu_ans = setTimeout(() => cpu_select_cards(), time);
}

// stop cpu from answering unless prepare_answer is run again
function reset() {
	clearTimeout(cpu_ans);
}

// displays hints to the user via a button click and alert
function print_hint() {
	let hint_cards = game.find_set();
	let hint_message = "A valid set contains (index by row: 0-3, 4-7, 8-11):";
	if(hint_cards.length > 0) {
		let index_string0 = hint_cards[0].toString();
		let index_string1 = ", " + hint_cards[1].toString();
		let index_string2 = ", " + hint_cards[2].toString();
		if(hint_num === 0) {
			hint_message = hint_message + index_string0;
			hint_num = 1
		} else if(hint_num === 1) {
			hint_message = hint_message + index_string0 + index_string1;
			hint_num = 2;
		} else {
			hint_message = hint_message + index_string0 + index_string1 + index_string2;
			hint_num = 0;
		}
	} else {
		hint_message = "There are no sets :(, reshuffle";
	}
	alert(hint_message);

}

// update DOM to display lifetime stats stored in stats.txt
function display_stats() {
	let statistics = document.getElementsByClassName("stat");
	for (let i = 0; i < statistics.length; i++) {
		statistics[i].innerText = statistics[i].title  + ": " + stats.stats_map.get(statistics[i].id.toString()).toFixed(2);
	}
}
















