require_relative 'board.rb'
require_relative 'display.rb'
require_relative 'player.rb'

class Game
  include Display
  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize
    @board = Board.new
    @player_one = nil
    @player_two = nil
    @current_player = nil
  end

  def start
    display_intro
    setup_players
    board.show
    play
    end_game
  end

  private

  def setup_players
    @player_one = create_player(1)
    @player_two = create_player(2)
    @current_player = [player_one, player_two].sample
    puts "\n #{current_player.name} has been randomly chosen to go first."
  end

  def create_player(number)
    display_player_name_prompt(number)
    player_name = gets.downcase.chomp

    display_player_marker_prompt
    player_marker = gets.downcase.chomp

    player = Player.new(player_name, player_marker)
    display_player_info(player)

    player
  end

  def play
    until board.full? do
      player_turns(current_player)
      break if board.game_over?

      @current_player = switch_player
    end
  end

  def player_turns(player)
    display_player_turn_prompt(player)
    position = validate_player_input
    update_board(position, player)
    board.show
  end

  def validate_player_input
    position = gets.chomp

    if position.match?(/^[1-9]$/)
      return position.to_i
    else
      display_invalid_input_warning
      validate_player_input
    end
  end

  def update_board(position, player)
    unless board.update(position, player.marker)
      display_dupe_position_warning
      play
    end
  end

  def switch_player
    current_player == player_one ? player_two : player_one
  end

  def end_game
    if board.game_over?
      display_winner_message(current_player)
    else
      display_tie_message
    end
  end
end
