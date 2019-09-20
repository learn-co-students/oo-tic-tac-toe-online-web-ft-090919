class TicTacToe
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
  
  @x_places = []
  @o_places = []
  
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
    #input from user to correspond to board position
    #board position will be input -1 (ex. board[input-1])
    
    user_input.to_i-1
  end
  
  def move(input, token = "X")
    #use input_to_index to take input and place token (either X or O) in that index position
    
    @board[input] = token
    @board
  end 
  
  def position_taken?(input)
    #check index values of @board to see if array element is empty or taken by X or O 
    
    @board[input] != " " ? true : false #does this ternary have correct syntax? Pipe or double pipe?
  end 
  
  def valid_move?(index)
    #check that position is valid (part of board array)
    #if above is true, use position_taken? to check that index is available
    #if all good, then true 
    
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn 
    #ask for input from user (ex: "Choose your square using 1-9")
    #receive input from user and use that to place token on board
    #use previous methods to define this method 
    
    print "Choose your square (1-9): "
    input = gets.chomp.to_i
    index = input_to_index(input)
    
    if valid_move?(index)  
      move(index, current_player) 
      display_board
    else 
      turn 
    end 
  end 
  
  def turn_count
    #count the number of turns so that game is over once all indexes are filled, stop at 9?
    
    @board.count {|e| e != " "}
  end 
  
  def current_player
    #alternate X and O tokens on each turn count 
    
    turn_count % 2 == 0 ? "X" : "O" 
  end 
  
  def won?
    #use class constant to check for winning combinations regardless of turns left 
    #take each combo, check if each element in combo equals all X or all O. Compare each element in combo to board elements
    winning_combo = nil 
    
    WIN_COMBINATIONS.each do |combo|
      if @board.values_at(combo[0], combo[1], combo[2]).all?("X")
        winning_combo = combo 
      elsif @board.values_at(combo[0], combo[1], combo[2]).all?("O")
        winning_combo = combo
      end
    end 
    winning_combo
  end 
    
  def full?
    #check if board is full or has empty spaces
    
    @board.all? {|e| e != " "} 
  end 
  
  def draw?
    #if board is full and there are no winning combinations, game is a draw
    
    full? && !won? 
  end 
  
  def over?
    #game is over is board has winning combinations or is full
    
    won? || draw? 
  end 
  
  def winner
    #display winner once a winning combination is met (return X or O as winner)
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if @board.values_at(combo[0], combo[1], combo[2]).all?("X")
        winner = "X"
      elsif @board.values_at(combo[0], combo[1], combo[2]).all?("O")
        winner = "O"
      end 
    end
    winner
  end 
  
  def play 
    #use all previous methods to define game loop and play 
    
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