require_relative "./player"
require_relative "./board"
require_relative "./display"
require 'colorize'

class Game
  include Display

  attr_accessor :p1, :p2, :board, :turn, :curr_player

  def initialize(turn = 0)
    @p1 = Player.new(blue_space, "Player 1".blue)
    @p2 = Player.new(red_space, "Player 2".red)
    @curr_player = @p1
    @board = Board.new
    @turn = turn
  end

  def start_game
    clear
    set_names
    clear
    @board.display_grid
    play_game
    congrats(@curr_player.name)
  end

  def valid_string?(input)
    input.class == String ? true : "Invalid input"
  end

  def verify_input(input)
    input.between?(1, 7) && input.class == Integer
  end

  def get_player_move
    player_move = -1
    until verify_input(player_move)
      ask_move(@curr_player.name)
      player_move = gets.chomp.to_i
    end
    player_move - 1
  end

  def play_game
    until @board.check_win?(@curr_player.symbol)
      turn_count
      @curr_player = player_turn(@turn)
      @board.update_board(get_player_move, @curr_player.symbol)
      clear
      @board.display_grid
    end
  end

  def turn_count
    @turn += 1
  end

  def player_turn(turn)
    turn.odd? ? @p1 : @p2
  end

  private

  def get_player_name(player)
    ask_name(player.name)
    player.name = gets.chomp
  end

  def set_names
    get_player_name(@p1)
    get_player_name(@p2)
  end
end
