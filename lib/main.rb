require_relative 'game.rb'

def start_game
  game = Game.new
  game.start
  repeat_game
end

def repeat_game
  puts "\nWould you like to start a new game? \nPress 'y' for yes or 'n' for no."
  input = gets.chomp.downcase

  if input == 'y'
    start_game
  else
    puts 'Thanks for playing!'
  end
end

start_game
