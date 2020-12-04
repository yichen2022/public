# frozen_string_literal: true
#This class holds functions for the creation and displaying of cards
#It consists of the card class with four features of the card represented by instance variables. 
#There is a function to check whether the three cards form a set or not. 
#It also contains a to_string function which returns the string representation of the card.
# @required colorize gem

require 'colorize'
# Creation of a card with methods for checking if three cards make a set and printing a card as a string
class Card
	# Constructor accepting the four features.
	attr_accessor :number
	attr_accessor :symbol
	attr_accessor :color
	attr_accessor :shading
	def initialize(num, sym, col, sha)
	  @number = num
	  @symbol = sym
	  @color = col
	  @shading = sha
	end

	#Displays the cards to the terminal 
	#Each card has a different number, color, shading, and symbol
	def to_string
		#3 symbol cards
		if @number == 3
			#3 symbol, red cards
			if @color == "red"
				#different shading 
				if @shading == "open"
					puts('┌──────────┐'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│ '.red+@symbol.red+'  '+@symbol.red+'  '+@symbol.red+'  │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('└──────────┘'.red)
				elsif @shading == "striped"
					puts('┌──────────┐'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│ '.red+@symbol.red+'  '+@symbol.red+'  '+@symbol.red+'  │'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('└──────────┘'.red)
				elsif @shading == "solid"
					puts('┌──────────┐'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│█'.red+@symbol.red+' █'.red+@symbol.red.bold+' █'.red+@symbol.red.bold+' █│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('└──────────┘'.red)
				end
			#3 symbol green cards
			elsif @color == "green"
					if @shading == "open"
						puts('┌──────────┐'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│ '.green+@symbol.green+'  '+@symbol.green+'  '+@symbol.green+'  │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('└──────────┘'.green)
					elsif @shading == "striped"
						puts('┌──────────┐'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│ '.green+@symbol.green+'  '+@symbol.green+'  '+@symbol.green+'  │'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('└──────────┘'.green)
					elsif @shading == "solid"
						puts('┌──────────┐'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│█'.green+@symbol.green+' █'.green+@symbol.green+' █'.green+@symbol.green+' █│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('└──────────┘'.green)
					end
				else #3 symbol purple cards
					if @shading == "open"
						puts('┌──────────┐'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│ '.blue+@symbol.blue+'  '+@symbol.blue+'  '+@symbol.blue+'  │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "striped"
						puts('┌──────────┐'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│ '.blue+@symbol.blue+'  '+@symbol.blue+'  '+@symbol.blue+'  │'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "solid"
						puts('┌──────────┐'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│█'.blue+@symbol.blue+' █'.blue+@symbol.blue+' █'.blue+@symbol.blue+' █│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('└──────────┘'.blue)
				end
			end
		#2 symbol cards
		elsif @number == 2
			#2 symbol red cards
			if @color == "red"
				if @shading == "open"
					puts('┌──────────┐'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│ '.red+@symbol.red+'     '+@symbol.red+'  │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('└──────────┘'.red)
				elsif @shading == "striped"
					puts('┌──────────┐'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│ '.red+@symbol.red+'     '+@symbol.red+'  │'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('└──────────┘'.red)
				elsif @shading == "solid"
					puts('┌──────────┐'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│█'.red+@symbol.red+' ████'.red+@symbol.red+' █│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('└──────────┘'.red)
				end
			#2 symbol, green cards
			elsif @color == "green"
					if @shading == "open"
						puts('┌──────────┐'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│ '.green+@symbol.green+'     '+@symbol.green+'  │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('└──────────┘'.green)
					elsif @shading == "striped"
						puts('┌──────────┐'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│ '.green+@symbol.green+'     '+@symbol.green+'  │'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('└──────────┘'.green)
					elsif @shading == "solid"
						puts('┌──────────┐'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│█'.green+@symbol.green+' ████'.green+@symbol.green+' █│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('└──────────┘'.green)
					end
				#2 symbol purple cards
				else
					if @shading == "open"
						puts('┌──────────┐'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│ '.blue+@symbol.blue+'     '+@symbol.blue+'  │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "striped"
						puts('┌──────────┐'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│ '.blue+@symbol.blue+'     '+@symbol.blue+'  │'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "solid"
						puts('┌──────────┐'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│█'.blue+@symbol.blue+' ████'.blue+@symbol.blue+' █│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('└──────────┘'.blue)
				end
			end
		#one symbol cards
		elsif @number == 1	
			#1 symbol, red cards
			if @color == "red"
				if @shading == "open"
					puts('┌──────────┐'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│ '.red+'   '+@symbol.red+'     │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('│          │'.red)
					puts('└──────────┘'.red)
				elsif @shading == "striped"
					puts('┌──────────┐'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│    '.red+@symbol.red+'     │'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('│----------│'.red)
					puts('└──────────┘'.red)
				elsif @shading == "solid"
					puts('┌──────────┐'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│████'.red+@symbol.red+' ████│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('│██████████│'.red)
					puts('└──────────┘'.red)
				end
			#1 symbol, green cards
			elsif @color == "green"
					if @shading == "open"
						puts('┌──────────┐'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│    '.green+@symbol.green+'     │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('│          │'.green)
						puts('└──────────┘'.green)
					elsif @shading == "striped"
						puts('┌──────────┐'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│    '.green+@symbol.green+'     │'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('│----------│'.green)
						puts('└──────────┘'.green)
					elsif @shading == "solid"
						puts('┌──────────┐'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│████'.green+@symbol.green+' ████│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('│██████████│'.green)
						puts('└──────────┘'.green)
					end
				#1 symbol purple cards
				else
					if @shading == "open"
						puts('┌──────────┐'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│    '.blue+@symbol.blue+'     │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('│          │'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "striped"
						puts('┌──────────┐'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│    '.blue+@symbol.blue+'     │'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('│----------│'.blue)
						puts('└──────────┘'.blue)
					elsif @shading == "solid"
						puts('┌──────────┐'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│████'.blue+@symbol.blue+' ████│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('│██████████│'.blue)
						puts('└──────────┘'.blue)
				end
			end
		end 
	#Prints the description of card for more visual clarification for the player 
	  puts ("\n" + 'Number: ' + @number.to_s + "\nSymbol: " + @symbol + "\nColor: " + @color + "\nShading: " + @shading)
	end

	# Checks if the three cards form a set or not
	def self.is_set(a, b, c)
	  # Accesses the attributes of the cards
	  # color
	  col1 = a.instance_variable_get(:@color)
	  col2 = b.instance_variable_get(:@color)
	  col3 = c.instance_variable_get(:@color)
	  # number
	  num1 = a.instance_variable_get(:@number)
	  num2 = b.instance_variable_get(:@number)
	  num3 = c.instance_variable_get(:@number)
	  # symbol
	  sym1 = a.instance_variable_get(:@symbol)
	  sym2 = b.instance_variable_get(:@symbol)
	  sym3 = c.instance_variable_get(:@symbol)
	  # shading
	  sha1 = a.instance_variable_get(:@shading)
	  sha2 = b.instance_variable_get(:@shading)
	  sha3 = c.instance_variable_get(:@shading)
	  # checks the features
	  # number
	  return false unless (num1 == num2) && (num2 == num3) || (num1 != num2) && (num1 != num3) && (num2 != num3)
	  # symbol
	  return false unless (sym1 == sym2) && (sym2 == sym3) || (sym1 != sym2) && (sym1 != sym3) && (sym2 != sym3)
	  # color
	  return false unless (col1 == col2) && (col2 == col3) || (col1 != col2) && (col1 != col3) && (col2 != col3)
	  # shading
	  return false unless (sha1 == sha2) && (sha2 == sha3) || (sha1 != sha2) && (sha1 != sha3) && (sha2 != sha3)
  
	  true
	end
end
