require_relative "./display"
require "colorize"

class Board
  attr_accessor :grid, :win

  include Display

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_space } }
    @last_move = nil
    @win = false
  end

  def display_grid
    @grid.each do |row|
      print "  "
      puts row.join(" ")
    end
    print "  "
    puts (1..7).to_a.join(" ")
  end

  def update_board(column, symbol)
    num = 5
    while num >= 0
      if @grid[num][column] == empty_space
        @grid[num][column] = symbol
        @last_move = @grid[num][column]
        break
      else
        num -= 1
      end
    end
  end

  def check_win?(symbol)
    check_match?(consecutive(@grid), symbol) || check_match?(consecutive(vertical), symbol) || check_diagonals?(symbol)
  end

  def check_match?(arr, symbol)
    arr.any? { |set| set == [symbol, symbol, symbol, symbol] }
  end

  def check_diagonals?(symbol)
    6.times { |row| 7.times { |col| return true if diagonals(row, col, symbol) } }

    false
  end

  def consecutive(arr)
    arr.map { |row| row.each_cons(4).to_a }.flatten(1)
  end

  def vertical
    new_arr = Array.new(7) { Array.new(6) { "." } }
    6.times { |row| 7.times { |col| new_arr[col - 1][row - 1] = @grid[row - 1][col - 1] } }
    new_arr
  end

  def diagonals(row, col, symbol)
    return if row > 2

    left_diagonals(row, col, symbol) || right_diagonals(row, col, symbol)
  end

  def left_diagonals(row, col, symbol)
    return if col < 3

    @grid[row][col] == symbol && @grid[row + 1][col - 1] == symbol && @grid[row + 2][col - 2] == symbol && @grid[row + 3][col - 3] == symbol
  end

  def right_diagonals(row, col, symbol)
    return if col > 3

    @grid[row][col] == symbol && @grid[row + 1][col + 1] == symbol && @grid[row + 2][col + 2] == symbol && @grid[row + 3][col + 3] == symbol
  end
end
