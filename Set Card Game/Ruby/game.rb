# frozen_string_literal: true

require_relative  'card'
require_relative  'deck'
require_relative  'player'
require_relative 'stats'
require 'colorize'
# Game class will maintain the deck and cards in play as well as all game logic
class Game
  attr_accessor :array_of_cards
  attr_accessor :deck
  attr_accessor :array_of_player
  attr_accessor :playable
  # Param array_of_player: an array that contains players' score.
  # Param array_of_cards: an array that contains active cards.
  # initialize the player array and the active cards array in the game
  def initialize
    @deck = Deck.new
    @array_of_player = []
    @array_of_cards = []
    @playable = true
  end

  # Param name: name of the player
  # add player into the game
  def add_player(name)
    @array_of_player.push(Player.new(name))
  end

  # Param name: name of the CPU player
  # Param difficulty: difficulty of the CPU player
  # add player into the game
  def add_cpu_player(name, difficulty)
    @array_of_player.push(ComputerPlayer.new(name, difficulty))
  end

  # deal appropriate number of cards to the board
  def deal
    until check_active_cards || @deck.new_cards.none?
      add_card(@deck.new_cards[0])
      @deck.next_card
    end
  end
  
  # check the number of active cards is greater than 12
  def check_active_cards
    @array_of_cards.length >= 12
  end

  # deals at most three additional cards as long as the deck is not empty
  def three_more
    i = 0
    until i == 3 || @deck.new_cards.none?
      add_card(@deck.new_cards[0])
      @deck.next_card
      i += 1
    end
  end

  # Finds a set in the array_of_cards and returns the indices of those cards or an empty array
  def find_set
    (0...(@array_of_cards.length - 1)).each do |i|
      (i + 1...(@array_of_cards.length - 1)).each do |j|
        (j + 1...(@array_of_cards.length - 1)).each do |k|
          return [i, j, k] if Card.is_set(@array_of_cards[i], @array_of_cards[j], @array_of_cards[k])
        end
      end
    end
    []
  end

  # check if there is a possible set in the remaining cards
  def check_set_all
    all_cards = @array_of_cards + @deck.new_cards
    (0...(all_cards.length - 1)).each do |i|
      (i + 1...(all_cards.length - 1)).each do |j|
        (j + 1...(all_cards.length - 1)).each do |k|
          return true if Card.is_set(all_cards[i], all_cards[j], all_cards[k])
        end
      end
    end
    false
  end

  # Param card: the card going to be removed
  # remove card from active cards array
  def remove_card(card)
    @array_of_cards.delete(card)
  end

  # Param card: the card going to be added
  # add card to active cards array
  def add_card(card)
    @array_of_cards.push(card)
  end

  # Param hint: number used to specify which one of the three hints you wish to push
  # Param hints: an array stores all three hints
  # return a hint for player if hint exists
  def hint_pusher(hint, hints)
      if hint == 0
        puts("\nA set can be made with card " + hints[hint].to_s + "\n\n")
      elsif hint == 1
        puts("\nA set can be made with card "  + hints[hint - 1].to_s + ' and card ' + hints[hint].to_s + "\n\n")
      elsif hint == 2
        puts("\nA set can be made with card "  + hints[hint - 2].to_s + ', card ' + hints[hint - 1].to_s + ', and card ' + hints[hint].to_s + "\n\n")
      else
        puts("\nA set can be made with card "  + hints[0].to_s + ', card ' + hints[1].to_s + ', and card ' + hints[2].to_s + "\n\n")
      end
    hint + 1
  end

=begin
  function will add three more cards to deck and one point to player if the set is correct, otherwise
  minus one point to the player.
=end
  def set_checker(card1, card2, card3, player, input)
    # if the given set is correct, remove set from the deck, add three new card and player point add 1
    if Card.is_set(card1, card2, card3)
      puts("\nCongrats, " + input + " that's a point!")
      player.consecutive_sets += 1
      player.points += player.consecutive_sets
      Stats.count_correct_answers
      remove_card(card1)
      remove_card(card2)
      remove_card(card3)
      deal
      Stats.count_num_deals
      while still_playable && find_set.length != 3
        three_more
        Stats.count_num_extra_deals
      end
    # if the given set is a wrong set, then player point minus one.
    else
      puts("\nSorry, " + input + ' that is incorrect. You lose one point.')
      player.consecutive_sets = 0
      player.points -= 1
      Stats.count_incorrect_answers
    end
    print_scores
    sleep(5)
    system 'clear'
    display_cards(@array_of_cards)
  end
  
  # check if the game is still playable
  def still_playable
    @playable = (@deck.new_cards.size + @array_of_cards.size).positive? && check_set_all
  end

  # Param sec, time you hope to count down
  # count down timer
  def timer_count(sec)
    (1..sec).each do |i|
      sleep 1
      i
    end
  end
    
  # prinr the score of the player
  def print_scores
    puts("\n")
    for player in @array_of_player
      puts(player.name + ": " + player.points.to_s)
    end
  end
end

