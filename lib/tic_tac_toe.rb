require 'pry'
class TicTacToe

 def initialize
   @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end


 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index (user_input)
  user_input.to_i - 1
end

def move (index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if  @board[index] == " "
  false
  else
  true
  end
end

def valid_move?(index)
  if !self.position_taken?(index) && (0..8).to_a.include?(index)
  true
  else
  false
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count.even? ? "X":"O"
end

def turn
 var = gets
 index = self.input_to_index(var)


 if valid_move?(index)
   token = current_player
   move(index, token)
 else
   gets
 end

 self.display_board
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    if @board[win_combination[0]] != " " &&@board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]
  	return win_combination
    end
  end

  false
end

def full?
  self.turn_count == 9
end

def draw?
  self.full? && !self.won?
end

def over?
  self.full? || self.won?
end

def winner
  if won?
    turn_count.even? ? "O":"X"
  else
    nil
  end
end

def play
  until !!self.over? == true || self.draw? == true do
    self.turn
  end

  if won?
    puts "Congratulations #{self.winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
