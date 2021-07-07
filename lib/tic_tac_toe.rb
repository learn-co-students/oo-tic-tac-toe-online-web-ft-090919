require'pry'

class TicTacToe
  

WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
    
    @@player = nil

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
    board = @board
  end  

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
   
  
  def input_to_index(move_index_string)
    move_i = move_index_string.to_i 
    move_i -=1
  end   
   
   
  def move(index, token = "X")
     @board[index] = token
  end
  
  def position_taken?(position)
  if @board[position]==(" ") 
      false
    else
      true
    end
  end
  
  def valid_move?(position)
      pos = position_taken?(position)
      if !pos && (position >= 0 && position <= 8)
      true
    else
      false
    end
  end


  def turn_count
    count = @board.count(" ") 
    turncount = (9 - count)
  end  


  def current_player
    count = @board.count(" ") 
    turncount = (9 - count)
    if turncount.odd?
      @@player = "O"
    else
      @@player = "X"
    end
  end  
  
  def turn
    puts "Please make your move enter 1-9"
    input = gets
    move_down = input_to_index(input)
   if valid_move?(move_down)
      player = current_player
      move(move_down,player)
      display_board
    else
       turn
    end
  end
  
  def full?
    if turn_count == 9
      true
    else
      false
    end
  end

  def won?
      won  = nil
    
      WIN_COMBINATIONS.each do |combo|

        position1 = combo[0]
        position2 = combo[1]
        position3 = combo[2]
      
           if @board[position1] == "X" && @board[position2] == "X" && @board[position3] =="X" 
           won = combo
           won
           elsif
           @board[position1] == "O" && @board[position2] == "O" && @board[position3] =="O" 
           won = combo
           won
           else
             if full? && won ==nil
              won
             end
           end
        end
      won
    end

  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end

 def winner
     if won?
       if turn_count.odd?
       winr = "X"
       else
       winr ="O"
       end
       winr
     end    
 end       

def play
  until over?
  turn
end
if won?
puts "Congratulations #{winner}!"
else
puts "Cat's Game!"  
end
end
  

    
end

   
         






      
