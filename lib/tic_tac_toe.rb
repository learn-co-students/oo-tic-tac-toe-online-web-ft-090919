require "pry"

class TicTacToe

  attr_accessor :board, :winner

  @winner = ""

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

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    (index >= 0 && index <= 8 && !position_taken?(index)) && !position_taken?(index)
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end


  def current_player
    player = nil

    count = turn_count

    count % 2 == 0 ? player = "X" : player = "O"

    player
  end

  def turn

    player = current_player

    puts "Player #{player} please enter a positon (1-9): "
    input = gets

    index = input_to_index(input)

    until valid_move?(index)
      puts "invalid move"
      puts "Player #{player} please enter a positon (1-9): "
      input = gets
      index = input_to_index(input)
    end

      move(index, player)
      display_board

  end

  def won?

    winner = nil

    WIN_COMBINATIONS.each do |index_array|

      line = @board[index_array[0]] + @board[index_array[1]] + @board[index_array[2]]

      if line == "XXX" || line == "OOO"
        winner = index_array[0], index_array[1], index_array[2]
      end

    end

    @winner = winner

    winner
  end

  def full?

    x_count = @board.count("X")
    o_count = @board.count("O")

    total = x_count + o_count

    if total == 9
      true

    else
      false
    end

  end

  def draw?

    if !won? && full?
      true
    else
      false
    end

  end

  def over?

    if draw? || won?
      true
    else
      false
    end

  end

  def winner

    win_line = won?

    if win_line
      line = @board[win_line[0]] + @board[win_line[1]] + @board[win_line[2]]
    else
      return win_line
    end

    line[0]
  end

  # ***************************************** END OF FIRST BATCH OF TEST *********************************************8

  def play

    until over?
      turn
    end

    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end

  end


# end of class
end
