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
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)
  @board[index] = value
end

  def position_taken?(spot)
    @board[spot]  =="X"  || @board[spot] == "O"
  end

  def valid_move?(spot)
    spot.between?(0,8)  && !position_taken?(spot)
  end

  def turn
    puts "Player please make a move. Enter 1-9"
    input = gets
    index = input_to_index(input)
    cp = current_player
    if valid_move?(index)
      move(index, cp)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.detect do |combo|
    position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
  end
end

  def full?
    @board.all?{|spot| spot == "X" || spot == "O"}
  end

  def draw?
    !won? && full? {false || true}
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?[0]] == "X" ? "X" : "O"
    else
      nil
    end
  end

  def play
  while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
