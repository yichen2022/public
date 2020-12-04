import Deck from './deck.js'
import Card from './card.js'
import Stats from './stats.js'
import { Player, ComputerPlayer } from './player.js'

// Game will hold all the logic for manipulating data objects (e.g. deck, cards on board, players)
export default class Game {
    constructor() {
        this.deck = new Deck();
        this.array_of_player = [];
        this.active_cards = [];
    }

    // if a user cannot find a set, reshuffle cards
    reshuffle(stats_map) {
        while (this.active_cards.length > 0) {
            this.deck.new_cards.push(this.active_cards.pop());
        }
        // track how many times the user reshuffles
        Stats.count_num_reshuffles(stats_map);
        this.deck.shuffle();
        this.deal(stats_map);
        // we don't wat to increment count of deals when reshuffling
        Stats.decrement_number_deals(stats_map);
    }

    // name is a string
    add_player(name) {
        this.array_of_player.push(new Player(name));
    }

    // name is a string difficulty is passed by user
    add_cpu_player(name, difficulty) {
        this.array_of_player.push(new ComputerPlayer(name, difficulty));
    }

    // adds the next card in the game's deck to the active cards
    add_card() {
        this.active_cards.push(this.deck.next_card());
    }

    // deal cards to board
    deal(stats_map) {
        while (this.active_cards.length < 12 && this.deck.new_cards.length !== 0) {
            this.add_card();
        }
        // count total number of deals
        Stats.count_num_deals(stats_map);
    }

    // removes the cards that made a set
    delete_cards(card_index_1, card_index_2, card_index_3) {
        this.active_cards.splice(this.active_cards.findIndex(card => card.index === card_index_1), 1);
        this.active_cards.splice(this.active_cards.findIndex(card => card.index === card_index_2), 1);
        this.active_cards.splice(this.active_cards.findIndex(card => card.index === card_index_3), 1);
    }

    // finds a set in the active array
    find_set() {
        let i = 0;
        let j = i + 1;
        let k = j + 1;
        let setFound = false;
        let returnSet = [];
        while(i < this.active_cards.length  && !setFound) {
            while(j < this.active_cards.length && !setFound) {
                while(k < this.active_cards.length && !setFound) {
                    if(Card.is_set(this.active_cards[i], this.active_cards[j], this.active_cards[k])) {
                        setFound = true;
                        returnSet = [i,j,k];
                    }
                    k++;
                }
                j++;
                k = j + 1;
            }
            i++;
            j = i + 1;
        }
        return returnSet;
    }

    // checks if theres any sets left in the entire game
    any_set() {
        let all_cards = this.active_cards.concat(this.deck.new_cards);
        let i = 0;
        let j = i + 1;
        let k = j + 1;
        let setFound = false;
        while(i < all_cards.length  && !setFound) {
            while(j < all_cards.length && !setFound) {
                while(k < all_cards.length && !setFound) {
                    if(Card.is_set(all_cards[i], all_cards[j], all_cards[k])) {
                        setFound = true;
                    }
                    k++;
                }
                j++;
                k = j + 1;
            }
            i++;
            j = i + 1;
        }
        return setFound;
    }

    // runs the players guess
    set_checker(index1, index2, index3, player, stats_map) {
        if(Card.is_set(this.active_cards[index1], this.active_cards[index2], this.active_cards[index3])) {
            Stats.count_correct_answers(stats_map);
            // unsure how output will be
            player.consecutive_sets++;
            player.points += player.consecutive_sets;
            // Blake I think you have something to add for your stat map in this
            // Stats.count_correct_answers(stat_map);
            this.delete_cards(this.active_cards[index1].index, this.active_cards[index2].index, this.active_cards[index3].index);
            this.deal(stats_map);
            return true;
            // Stats.count_num_deals(stat_map);
        } else {
            // output again
            Stats.count_incorrect_answers(stats_map);
            player.consecutive_sets = 0;
            player.points--;
            return false;
        }
    }
}
