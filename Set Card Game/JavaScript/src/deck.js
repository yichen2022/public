import Card from './card.js'

// Deck used to draw cards from during game
export default class Deck {
	constructor() {
		const numbers = [1, 2, 3];
		const symbols = ["diamond", "oval", "squiggle"];
		const colors = ["red", "green", "purple"];
		const shadings = ["open", "lined", "solid"];
		this.new_cards = [];
		// fill new_cards with 81 unique cards (indx corresponds to the name of the .png the card references
		let indx = 0;
		for (let a = 0; a < colors.length; a++) {
			for (let b = 0; b < shadings.length; b++) {
				for (let c = 0; c < symbols.length; c++) {
					for (let d = 0; d < numbers.length; d++) {
						this.new_cards.push(new Card(numbers[d], symbols[c], colors[a], shadings[b], indx));
						indx++;
					}
				}
			}
		}
		this.shuffle();
	}

	// shuffle cards to ensure randomness
	shuffle(){
		let len = this.new_cards.length, temp, i;

		while (len > 0) {
        	i = Math.floor(Math.random() * len);
        	len--;
        	temp = this.new_cards[len];
        	this.new_cards[len] = this.new_cards[i];
        	this.new_cards[i] = temp;
    		}

	}

	// remove cards from deck when dealing
	next_card() {
	    return(this.new_cards.shift());
	}
}
