# coding: utf-8
# frozen_string_literal: true

require_relative 'card'
require 'colorize'
# Creation of a deck and functions required to manipulate a deck
#
class Deck
  attr_accessor :new_cards
  # A constructor to return a well shuffled deck of 81 cards
  # return: Array of cards
  def initialize
    numbers = [1, 2, 3]
    symbols = %w[⋄ ⌇ ♥]
    colors = %w[red green purple]
    shading = %w[solid striped open]
    @new_cards = []
    numbers.each do |i|
      symbols.each do |j|
        colors.each do |k|
          shading.each do |l|
            @new_cards.push(Card.new(i, j, k, l))
          end
        end
      end
    end
    @new_cards.shuffle!
  end

  # This function returns the next card of the deck
  # return: card 

  def next_card
    @new_cards.shift
  end

  # This function returns the color of the card
  # return: color 

  def colorcard
     @color
  end

  # This function returns true as soon as there is a set in the deck or returns false otherwise
  # return: bool true/false

  def check_if_set
    (0..(@new_cards.length - 1)).each do |i|
      (i + 1..(@new_cards.length - 1)).each do |j|
        (j + 1..(@new_cards.length - 1)).each do |k|
          return true if Card.is_set(@new_cards.at(i), @new_cards.at(j), @new_cards.at(k))
        end
      end
    end
    false
  end
end
