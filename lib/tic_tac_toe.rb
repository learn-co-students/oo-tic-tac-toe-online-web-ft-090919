require "pry"

class TicTacToe
  attr_accessor :num, :turn, :moves, :turn_count
  
  def initialize
    @board = Array.new(9, " ")
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
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    print "-----------"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    print "-----------"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
    
  def input_to_index(string)
    @num = string.to_i
    @num - 1
  end
  
  def move(num, token = "X")
    @board[num] = token
  end
  
  def position_taken?(num)
    @board[num] != " "
  end
  
  def valid_move?(num)
    #binding.pry
    !position_taken?(num) && num <= 8 && num >= 0
  end
  
  def turn
    string = gets "Where do you want to play?: "
    @num = input_to_index(string)
    valid_move?(num) ? move(num, current_player) : self.turn
    display_board
  end
  
  def turn_count
    @turn = 0
    @board.each do |move|
      if move != " "
        @turn += 1
      end
    end
    @turn
  end
  
  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        position_1  =  @board[win_index_1]
        position_2  =  @board[win_index_2]
        position_3  =  @board[win_index_3]
        if position_1 == "O" && position_2 == "O" && position_3 == "O"
          all_O = [position_1, position_2, position_3]
        elsif position_1 == "X" && position_2 == "X" && position_3 == "X"
          all_X = [position_1, position_2, position_3]
        else
          nil
        end
    end
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    won? == nil && full?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won?
      i_won = ((turn_count - 1) % 2 == 0) ? "X" : "O"
    end
  end
  
  def play
    while over? != true
      turn
      if won? != nil
        winner
        exit
      elsif draw? == true
        "It's a cats game!"
        exit
      end
    end
  end
  
end