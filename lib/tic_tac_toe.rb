class TicTacToe
  WIN_COMBINATIONS = [
    #Horizontal Win Cons
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #Vertical Win cons
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #Diagnal win cons
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
    input.to_i - 1
  end

  def move(index, token="X")
   @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index >= 0 && index < 9 && !position_taken?(index)
  end

  def turn_count
    @board.count { |pos| pos != " " }
  end

  def current_player
    #X has odd turns, o has even, so if there's an even number of moves, it's x.
    turn_count.even? ? "X" : "O"
  end

  def turn
    move = nil
    until (!!move && valid_move?(move))
      puts "Please enter the location you would like to place a piece"
      move = input_to_index(gets.strip)
    end
    move(move, current_player)
    display_board
  end

  def won?
    won = nil
    WIN_COMBINATIONS.each do |wincon|
      won = wincon if @board[wincon[0]] == @board[wincon[1]] && @board[wincon[1]] == @board[wincon[2]] && @board[wincon[0]] != " "
    end
    won
  end

  def full?
    @board.none? { |el| el == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    !!won? ? @board[won?.first] : nil
  end

  def play
    until over?
      turn
    end

    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    else
      puts "Cat's Game!"
    end
  end
end
