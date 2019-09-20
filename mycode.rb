 puts "What position would you like between 1-9?"
     input = gets.chomp
     position = input_to_index(input)
     token = current_player
     if valid_move?(position) 
       move(position, token)
       display_board
       
       
  require 'pry'

class TicTacToe
  attr_accessor :board
  attr_reader :input
  WIN_COMBINATIONS = 
 [[0,1,2], 
  [3,4,5], 
  [6,7,8], 
  [0,3,6], 
  [1,4,7], 
  [2,5,8], 
  [2,4,6], 
  [0,4,8]]
  
  def initialize
    board = Array.new(9, " ")
    @board = board 
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(input)
      @input = input.to_i - 1
  end 
  
  def move(position, token = "X")
    @board[position] = token
  end 
  
  def position_taken?(value)
   if @board[value] == "X" 
     true 
   elsif 
     @board[value] == "O" 
     true
   else
     false 
   end 
 end 
 
   def valid_move?(position)
    !position_taken?(position) && position.between?(0, 8)
    end 

      
  def turn 
     puts "Please enter a number (1-9):"
     input = gets.chomp
     position = input_to_index(input)
     if valid_move?(position)
       token = current_player
       move(position, token)
      else
        turn
      end 
      display_board
   end 
   
  
  def turn_count 
   count = 0 
   @board.each do |slot|
     if slot == "X" || slot == "O"
       count += 1 
       end 
     end 
    count
   end 
   
   
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end 
  
  def won?
    WIN_COMBINATIONS.detect do |combo| if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"  
      combo 
    elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O" 
     combo 
    else
      nil 
    end 
  end
 end 

 def full?
   @board.all? { |spot| spot != " " }
 end
 
 def draw?
   if full? == true && won? == nil 
     true 
   end 
 end 
 
 def over?
   if won? != nil || draw? == true 
     true
   end 
 end 
 
 def winner
    WIN_COMBINATIONS.detect do |combo| if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"  
      return "X"
    elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O" 
     return "O"
    else
     nil 
    end 
  end
 end 
 
  def play 
    while over? != true 
    turn
      if turn == won?
      "Congratulations #{winner}!"
      elsif  draw?
      "Cat's Game!"
      else 
      play 
      end 
    end 
   
   end 
      
  
 
end 

# Array:
# 0  1  2 
# 3  4  5 
# 6  7  8