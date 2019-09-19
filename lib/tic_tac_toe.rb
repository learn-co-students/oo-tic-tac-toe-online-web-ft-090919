class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0, 1, 2], 
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
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
  
  def input_to_index(input_string)
    input_integer = input_string.to_i - 1
  end 
  
  def move (move_index, token)
    @board[move_index] = token
  end 
  
  
  def position_taken?(move_index)
    if @board[move_index] == " "
      false 
    else 
      true 
    end
  end
  
  def valid_move?(move_index)
    if !position_taken?(move_index) && move_index.between?(0, 8) 
      true 
    else 
      false 
    end 
  end
  
  def turn_count 
    count = 0 
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end 
    count 
  end
  
  def current_player
    if turn_count.even?
      "X"
    else 
      "O"
    end 
  end 
  
  def turn 
    puts "Please select a position between 1-9"
    input = gets.chomp
    move_index = input_to_index(input)
    player = current_player
    if valid_move?(move_index) == true
      move(move_index, player)
      display_board
    else 
      puts "invalid move choice, please select a valid position"
      turn
    end
  end
  
 def won?
   WIN_COMBINATIONS.detect do |winning_combo|
     if (@board[winning_combo[0]]) == "X" && (@board[winning_combo[1]]) == "X" && (@board[winning_combo[2]]) == "X"
        return winning_combo
      elsif (@board[winning_combo[0]]) == "O" && (@board[winning_combo[1]]) == "O" && (@board[winning_combo[2]]) == "O"
       return winning_combo 
    end
      false
  end
end

  def full?
    if !@board.include?(" ")
      true
    else 
      false
    end 
  end
  
  
  def draw?
    if full? && !won?
      true 
    else 
      false
    end 
  end 
  
  def over?
    
    if won? || full? || draw?
      true 
    else 
      false 
    end 
  end 
  
  def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
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








