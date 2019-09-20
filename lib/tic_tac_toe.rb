class TicTacToe
  attr_accessor :board

  # cell_0, cell_1, cell_2
  # cell_3, cell_4, cell_5
  # cell_6, cell_7, cell_8
  WIN_COMBINATIONS = [
    # HORIZONTAL WINS
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    # VERTICAL WINS
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    # DIAGONAL WINS
    [0, 4, 8],
    [2, 4, 6]
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

  def input_to_index(str_index)
    str_index.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count { |token| token != " " }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.find { |combo|
      board_cells = combo.collect { |postion| @board[postion] }
      combo if board_cells.uniq.length == 1 && !board_cells.include?(" ")
    }
  end

  def full?
    !@board.include?(" ")
  end
  
  def draw?
    (full? && !won?)
  end
  
  def over?
    (draw? || won?)
  end

  def winner
    @board[won?.first] if won?
  end

  def play
    turn until over?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end