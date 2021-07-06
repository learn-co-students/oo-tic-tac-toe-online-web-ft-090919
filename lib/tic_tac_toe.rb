class TicTacToe
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,3,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
   # board = Array.new(9, " ")
  end
  
 # def initialize(board = nil)
 #   @board = board || Array.new(9, " ")
 # end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end
  
    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
  
  def input_to_index(user_input) 
    user_input.to_i - 1
  end
  
  def move(board, index, player = "X")
    board[index] = player
  end
  
  def postion_taken?(board, index)
    if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      return false 
    else 
      return true 
    end
  end
  
  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board, index)   #if index is between 0 and 8 aka 1-9 and the position taken method does not return true (i.e the position is not taken), then it is a valid move
      return true
    end 
  end
  
  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip #gets.chomp
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
    end 
    display_board(board)
  end
  
  def won?(board)
    WIN_COMBINATIONS.each do 
      |win_combination| 
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]      
      win_index_3 = win_combination[2]
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1) 
      #Not clear how this works - revise
    end 
  end
  
  def full?(board)
    board.all? {|i| i == "X" || i == "O"}
  end 
  
  def draw?(board)
    if !won(board) && full?(board)
      return true 
    elsif !won?(board) && !full?(board)
      return false 
    else won?(board)
      return false 
    end 
  end 
  
  def over?(board)
    if draw?(board) || won?(board) || full?(board)
      return true 
    end 
  end
  
  def winner(board)
    if won?(board)
      return board[won?(broad)[0]]
      #not 100% clear as well
    end 
  end

end