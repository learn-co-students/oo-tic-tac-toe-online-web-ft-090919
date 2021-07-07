class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    convert_input = user_input.to_i - 1
  end
  
  def move(idx, token = "X")
    @board[idx] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true 
    else
      false 
    end
  end
  
  def valid_move?(position)
    if position.between?(0,8) && position_taken?(position) ==  false
      true
    else
      false
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    while true
      puts "Enter your move between 1-9"
      move = gets.chomp
      index_move = input_to_index(move)
      
        if valid_move?(index_move)
          move(index_move, current_player)
          display_board
          break
        end
    end
  end
  
 def won?
   @winning_combo = nil
  WIN_COMBINATIONS.detect do |ele|
    if (@board[ele[0]]) == "X" && (@board[ele[1]]) == "X" && (@board[ele[2]]) == "X"
      @winning_combo = "X"
      return ele
    elsif (@board[ele[0]]) == "O" && (@board[ele[1]]) == "O" && (@board[ele[2]]) == "O"
    @winning_combo = "O"
      return ele
    end
      false
   end
 end
  
  
  def full?
    board_count = 0 
    board_full = nil
    @board.each do |ele|
      if ele == "X" || ele == "O"
        board_count += 1
      end     
    end
    
    if board_count == 9 
      board_full = true 
      
    end
    board_full
  end
  
 def draw?
    !won? && full? ? true : false
  end
  
  def over?
    is_over = nil
    if (won? || full?) || draw?
      is_over = true 
    end
    is_over 
  end
  
  def winner
    winning_player = nil
    if won?
      winning_player = @winning_combo
    end
    winning_player 
  end
  
  def play
    until over?
      turn
    end

    if won? 
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end