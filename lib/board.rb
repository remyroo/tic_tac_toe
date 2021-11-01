require 'pry';

class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) }
  end

  def show
    puts "\n"
    grid.each do |row|
      puts row.map { |cell| cell.nil? ? "_" : cell }.join(" | ")
    end
    puts "\n"
  end

  def update(position, value)
    cell = grid_mapper(position)

    if grid[cell[0]][cell[1]].nil?
      grid[cell[0]][cell[1]] = value
    else
      false
    end
  end

  def full?
    grid.none? { |cells| cells.include?(nil) }
  end

  def game_over?
    winning_combos.each do |combo|
      next if combo.any? { |cell| cell.nil? }
      return true if combo.all? { |cell| cell == combo[0] }
    end
    false
  end

  private

  def grid_mapper(position)
    {
      1 => [0, 0],
      2 => [0, 1],
      3 => [0, 2],
      4 => [1, 0],
      5 => [1, 1],
      6 => [1, 2],
      7 => [2, 0],
      8 => [2, 1],
      9 => [2, 2]
    }[position]
  end

  def winning_combos
    grid + grid.transpose + diagonals
    # rows + columns + diagonals
  end

  def diagonals
    [
      [grid[0][0], grid[1][1], grid[2][2]],
      [grid[0][2], grid[1][1], grid[2][0]]
    ]
  end
end
