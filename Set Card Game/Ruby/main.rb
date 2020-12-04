# frozen_string_literal: true

require 'ruby2d'
require_relative 'game'
require_relative 'card'
require_relative 'player'
require_relative 'timer'
require_relative 'scores'
require_relative 'stats'
require 'colorize'
require 'timeout'

# list of characters not allowed in player names
key_words = %w[]
key_words.push("\t")
key_words.push("\n")
key_words.push("\s")

# check if user input consists of 3 indices corresponding to cards
def valid_set_input(three_cards, game)
  return false if three_cards.length != 3

  card_indices = (0..game.array_of_cards.length).to_a
  return false if three_cards.any? { |card| !card_indices.include?(card) }
  return false if three_cards.detect { |card| three_cards.count(card) > 1 }

  true
end

# display cards in play
def display_cards(cards)
  i = 0
  cards.each do |card|
    puts ' '
    puts card.to_string
    puts(i.to_s.bold)
    puts '______________'.black
    i += 1
  end
end

# start menu that gives player options to display game information or start a game
print("Welcome to Set! Enter \"Start\" to begin, or \"menu\" for more options: ")
menu_command = gets.to_s.chomp!
until menu_command == 'Start'
  case menu_command
  when 'menu'
    print("Enter \"scores\" for the high score list\n")
    print("Enter \"stats\" for the game statistics\n")
  when 'scores'
    high_scores = Scores.new
    puts("\n")
    high_scores.display_scores
    puts("\n")
  when 'stats'
    puts("\n")
    Stats.display_stats
    puts("\n")
  end
  print("Welcome to Set! Enter \"Start\" to begin, or \"menu\" for more options: ")
  menu_command = gets.to_s.chomp!
end


#start game, begin process of collecting stats, and start game
game_start = Music.new('assets/MI.mp3')
game_end = Sound.new('assets/winning.wav')

game = Game.new

game_start.play
game_start.loop = true


# loop that checks if player name is acceptable or adds a cpu player
print('Input a name and hit enter to add player or hit enter with no name [""] to begin the game: ')
name = gets.to_s.chomp!
until name.empty? && !game.array_of_player.empty?
  if name == 'hint' || key_words.any? {|char| name.include? char}
    puts("\nThat name is unacceptable\n")
  elsif !name.empty?
    if game.array_of_player.detect { |player| player.name == name }
      puts("\nDuplicate names are not allowed\n")
    else
      if name == 'cpu'
        print("\nPlease select a difficulty level 0, 1, or 2 (0:easy, 1:medium, 2:hard): ")

        difficulty = gets.to_s.chop!
        until difficulty == '0' || difficulty == '1' || difficulty == '2'
          print("\nYou must select a difficulty level 0, 1, or 2 (0:easy, 1:medium, 2:hard): ")
          difficulty = gets.to_s.chop!
        end
        game.add_cpu_player(name, difficulty)
        puts("\nThe computer player (cpu) has been added to the game\n")
      else
        game.add_player(name)
        puts("\nPlayer: " + name + " has been added to the game\n")
      end
    end
  else
    puts("\nYou must have at least one player before starting the game\n")
  end
  print("\nInput a name and hit enter to add player or hit enter with no name [\"\"] to begin the game: ")
  name = gets.to_s.chomp!
end

Stats.read_stats

# deal cards and track total number of hands dealt
game.deal
Stats.count_num_deals

# deal cards until a set is in play
while game.still_playable && game.find_set.length != 3
  game.three_more
  Stats.count_num_extra_deals
end

#display cards
display_cards(game.array_of_cards)

timer = Timer.new

hint = 0
# hints will hold an answer for each hand
hints = game.find_set

# once the game is no longer playable, quit
while game.playable


  print('Whoever finds a set first, say "SET!" and type your name (or request a hint with [hint]): ')


  # if there is a cpu player, allow cpu to answer within a specified time
  # if there is not a cpu plaeyer, wait for user input
  if game.array_of_player.any? { |player| player.name == 'cpu'  }
    cpu_array = game.array_of_player.select { |player| player.name == 'cpu' }
    cpu = cpu_array[0]
    cpu.get_answer(hints)
    cpu.get_num_cards(game.array_of_cards.length)
    cpu.get_wait_time
    stall = cpu.get_wait_time
    begin
      input = Timeout.timeout(stall) do
        ans = gets.to_s.chop!
        until ans != 'cpu'
          puts("\n\nBeep boop. Who do you think you are?\n")
          print('Whoever finds a set first, say "SET!" and type your name (or request a hint with [hint]): ')
          ans = gets.to_s.chop!
        end
        ans
      end
    rescue Timeout::Error
      input = cpu.name
    end
  else
    begin
      input = Timeout.timeout(30) { gets.to_s.chop! }
    rescue Timeout::Error
      #offer a hint if the users have not answered within 30 seconds
      puts("\n\nNeed some help?")
      print("Type 'hint' to see a card that is part of a set or type your name once a set is found: ")
      input = gets.to_s.chop!
    end
  end

  case input
    # if the user requests a hint, give them a hint depending on the number of hints previously requested
  when 'hint'
    hint = game.hint_pusher(hint, hints)
  else
    # logic for player input and how points are calculated
    if game.array_of_player.detect { |player| player.name == input }
      player_array = game.array_of_player.select { |person| person.name.eql? input }

      player = player_array[0]
      #if the player is a cpu, allow the cpu to generate an answer
      if player.name == 'cpu'

        print("\n" + input + ', please enter the indices of three cards that make a set: ')
        answer = cpu.make_choice
        sleep(2)
        puts("\n\nbeep boop: " + answer)
        sleep(2)
        set = answer.split.map(&:to_i)
        # if the player is a person, demand an answer within 10 seconds
      else
        print("\n" + input + ', please enter the indices of three cards that make a set: ')

        begin
          set = Timeout.timeout(10) { gets.to_s.chop! }
        rescue Timeout::Error
          puts("\n\nYou took to long, selecting first three cards")
          set = '0 1 2'
        end

        set = set.split.map(&:to_i)
        valid_set = valid_set_input(set, game)

        # if there is improper input, request proper input

        until valid_set
          print("\n" + input + ', that is improper input. Please enter the indices of three cards that make a set: ')
          set = gets.split.map(&:to_i)
          valid_set = valid_set_input(set, game)
        end
      end

      # check if cards were in a set and either increment or decrement points, deal new cards
      game.set_checker(game.array_of_cards[set[0]], game.array_of_cards[set[1]], game.array_of_cards[set[2]], player, input)
      # reset hints and find new solution
      hint = 0
      hints = game.find_set

    else
      puts("\nThat was not a recognized input, please try again\n\n")
    end
  end
end

# calculate relevant statistical info and declare a winner(s)

Stats.total_time(timer.stop_timer)

high_score_player = game.array_of_player.max_by(&:points)
high_score = high_score_player.points
high_score_players = game.array_of_player.select { |player| player.points == high_score }

game_start.stop
game_end.play

high_score_players.each { |player| puts('CONGRATULATIONS, ' + player.name.upcase + "! YOU'VE WON!\n") }

Stats.count_num_games
Stats.avg_game_length
Stats.chance_of_no_set
Stats.avg_accuracy

Stats.write_stats
# Can add high score
puts("Do you want to add this high score(s) to the all time list? (Y/N) ")
response = gets.to_s.chomp!
while(!(response == 'Y' || response == 'N'))
  puts("I'm sorry, what was that? (Please enter Y/N")
  response = gets.to_s.chomp!
end

if(response == 'Y')
  new_high_scores = Scores.new
  high_score_players.each do |hs_player|
    playerMap = Hash.new
    new_high_scores.add_score(playerMap, hs_player.points, hs_player.name)
  end
  new_high_scores.display_scores
end

