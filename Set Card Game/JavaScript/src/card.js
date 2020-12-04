// Data object to represent a card (81 total)
export default class Card {
	constructor(num, sym, col, sha, indx) {
		this.number = num;
		this.symbol = sym;
		this.color = col;
		this.shading = sha;
		this.index = indx;
	}

	// Determine if three cards (a, b, c) comprise a set
	static is_set(a, b, c) {
		//Accesses the attributes of the cards
		//color
		let col1 = a.color;
		let col2 = b.color;
		let col3 = c.color;
		//symbol
		let sym1 = a.symbol;
		let sym2 = b.symbol;
		let sym3 = c.symbol;
		//shading
		let sha1 = a.shading;
		let sha2 = b.shading;
		let sha3 = c.shading;
		//number
		let num1 = a.number;
		let num2 = b.number;
		let num3 = c.number;
		//checks the features
		//number
		if (!((num1 == num2) && (num2 == num3) || (num1 != num2) && (num1 != num3) && (num2 != num3))) return false;
		//symbol
		if (!((sym1 == sym2) && (sym2 == sym3) || (sym1 != sym2) && (sym1 != sym3) && (sym2 != sym3))) return false;
		//shading
		if (!((sha1 == sha2) && (sha2 == sha3) || (sha1 != sha2) && (sha1 != sha3) && (sha2 != sha3))) return false;
		//color
		if (!((col1 == col2) && (col2 == col3) || (col1 != col2) && (col1 != col3) && (col2 != col3))) return false;
		return true;
	}
}

