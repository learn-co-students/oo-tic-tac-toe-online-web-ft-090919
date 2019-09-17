require "pry"

class TicTacToe

  attr_accessor :board

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

  end

  def input_to_index(input)

    index = input.to_i

    index -= 1

    index
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index)
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end


  def current_player
    player = nil
    moves_made = 0

    moves_made += @board.count("X")
    moves_made += @board.count("O")

    player = moves_made% 2 == 0 ? player = "X" : player = "O"
    # binding.pry
    player
  end

  def turn

    input = gets

    index = input_to_index(input)

    if !valid_move?(index)
      puts "invalid"
      input = gets
    end

    # if valid_move?(index)
      player = current_player
      move(index, player)
      display_board
      # binding.pry

    # end

  end

  def won?

    winner = nil

    WIN_COMBINATIONS.each do |index_array|

      line = @board[index_array[0]] + @board[index_array[1]] + @board[index_array[2]]

      if line == "XXX" || line == "OOO"
        winner = index_array[0], index_array[1], index_array[2]
      end

    end

    winner
  end

  def full?

    x_count = @board.count("X")
    o_count = @board.count("O")

    total = x_count + o_count

    if total == 9
      true
    elsif x_count == 4 && o_count == 4
      true
    else
      false
    end
    # binding.pry
  end

# end of class
end
