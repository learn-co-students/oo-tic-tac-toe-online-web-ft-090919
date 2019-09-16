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
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count { |pos| pos != " " }
  end

  def current_player
    #X has odd turns, o has even, so if there's an even number of moves, it's x.
    turn_count.even? ? "X" : "O"
  end

  def turn
    player = current_player
    move = nil
    until (!!move && valid_move?(move))
      puts "Player #{player}, please enter the location where you would like to place a piece."
      move = input_to_index(gets.strip)
    end
    move(move, player)
    display_board
  end

  def won?
    won = nil
    WIN_COMBINATIONS.each do |wincon|
      #get all unique pieces in the relevent positions
      pieces = wincon.map { |index| @board[index] }.uniq
      #If the length is 1 then all the pieces have the same value, if the value isn't blank than someone has won
      won = wincon if pieces.length == 1 && pieces.first != " "
    end
    won
  end

  def full?
    #Full if none of the spots are empty
    @board.none? { |el| el == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    #If one isn't nill, return the winning piece, else nill
    !!won? ? @board[won?.first] : nil
  end

  def play
    display_board
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
