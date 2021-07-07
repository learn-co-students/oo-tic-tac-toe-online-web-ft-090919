class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2], [0,3,6], [0,4,8], [3,4,5], [6,7,8], [1,4,7], [2,5,8], [2,4,6]]

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
  
  def input_to_index(user_input)
    user_input.to_i - 1
    end 
    
    
  
  def move(index, token)
    @board[index] = token
  end
  
  
  
  
  
  def position_taken?(index)
  !(@board[index] == " ")
  end
  
  
  
  def valid_move?(index)
  if position_taken?(index) == false && index.between?(0, 8)
    true 
  else position_taken?(index) == true 
    false
  end 
    end
    
    
    
    def turn_count
      counter = 0 
      @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1 
      end 
    end
      counter
    end 
    
    
    
    def current_player
      turn_count.even? == true ? "X" : "O"
    end
    
    
    
  
  def turn
	puts "Please enter 1-9:"
	user_input = gets.chomp
	index = input_to_index(user_input)
	if valid_move?(index) == true && current_player == "X"
			move(index, value = "X")
			puts display_board
	elsif valid_move?(index) == true && current_player == "O"
			move(index, value = "O")
			puts display_board
	elsif valid_move?(index) == false
		puts "Please enter 1-9:"
		input = gets.chomp
	else 
		puts "Please enter 1-9:"
		input = gets.chomp
	end
end
  
  
  
  def won?
    WIN_COMBINATIONS.detect { |combo|
    position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    }
  end
  
  # WIN_COMBINATIONS.detect do |win_combo|
  # if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
  #   win_combo
  #   elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
  #     win_combo
  #   end
  #     false
  #   end
  
  
  
  
  def full?
    @board.all? { |index| index == "X" || index == "O"}
  end 
  
  
  
  def draw?
    if won? 
			false
		elsif full? == false 
			false 
		else 
			true
		end
  end 
  
  
  def over?
    won? || draw?
  end 
  
  
  def winner
    winner = won?
    if winner
      @board[winner[0]]
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










# class TicTacToe
  
  
# def initialize(board = nil)
# @board = Array.new(9, " ")
# end


# WIN_COMBINATIONS = [
# [0,1,2], #top row
# [3,4,5], #middle row
# [6,7,8], #bottom row
# [0,3,6], #left column
# [1,4,7], #middle column
# [2,5,8], #right column
# [0,4,8], #diagonal 1
# [2,4,6] #diagonal 2
# ]


# def display_board
#   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#   puts "-----------"
#   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#   puts "-----------"
#   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
# end


# def input_to_index(user_input)
#   user_input.to_i - 1
# end
 
 
# def move(position, char)
#   @board[position] = char
# end
 
 
# def position_taken?(index_i)
#   ((@board[index_i] == "X") || (@board[index_i] == "O"))
# end
 
 
# def valid_move?(index)
#   index.between?(0,8) && !position_taken?(index)
# end
 
 
# def turn_count
#   number_of_turns = 0
#   @board.each do |space|
#   if space == "X" || space == "O"
#       number_of_turns += 1
#   end
# end
# return number_of_turns
# end



# def current_player
#   if turn_count % 2 == 0
#   "X"
#   else
#   "O"
# end
# end


# def turn
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   token = current_player
#   if valid_move?(index)
#     move(index, token)
#     display_board
#   else
#     turn
#   end
# end


# def won?
# WIN_COMBINATIONS.detect do |win_combo|
#   if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
#     return win_combo
#   elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
#     return win_combo
#   end
#     false
# end
# end



# def full?
# @board.all? { |used| used != " "}
# end


# def draw?
# !(won?) && (full?)
# end


# def over?
# won? || full? || draw?
# end


# def winner
# WIN_COMBINATIONS.detect do |win_combo|
#   if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
#     return "X"
#   elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
#     return "O"
#   else
#     nil
#   end
# end
# end



# def play
# while over? == false
#   turn
# end
# if won?
#   puts "Congratulations #{winner}!"
# elsif draw?
#   puts "Cat's Game!"
# end
# end


# end