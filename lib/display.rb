module Display
  def display_short_divider
    puts "---" * 15
  end

  def display_intro
    puts "*" * 25
    puts "\nWelcome to Tic Tac Toe"
  end

  def display_player_name_prompt(number)
    puts "Player #{number}: enter your name:"
  end

  def display_player_marker_prompt
    puts "What's your game marker? (Note: it must be 1 letter):"
  end

  def display_player_info(player)
    puts "Player created: #{player.info}."
    display_short_divider
  end

  def display_player_turn_prompt(player)
    puts "#{player.name} place your marker in an available cell by selecting a number 1-9."
  end

  def display_invalid_input_warning
    puts "Oops, that's an invalid input. Please try again."
  end

  def display_dupe_position_warning
    puts "That position has already been played. Please select a different cell."
  end

  def display_winner_message(player)
    display_short_divider
    puts "Congrats #{player.name}, you won!"
    display_short_divider
  end

  def display_tie_message
    display_short_divider
    puts "Game over - it's a tie"
    display_short_divider
  end
end
