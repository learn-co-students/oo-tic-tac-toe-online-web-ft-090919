

# class TicTacToe


#     def initialize(board = nil)
#         @board = Array.new(9, " ")
#     end

#     WIN_COMBINATIONS = [
#         [0,1,2], #top row
#         [3,4,5], #middle row
#         [6,7,8], #bottom row
#         [0,3,6], #left column
#         [1,4,7], #middle column
#         [2,5,8], #right column
#         [0,4,8], #diagonal 1
#         [2,4,6] #diagonal 2
#     ]

#     def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#     end

#     def input_to_index(input)
#         input.to_i - 1 
#         #turn user input from string to integer. Then subtract one so that it matches up with correct array index.
#     end

#     def move(index, token = "X")
#        @board[index] = token  #set the array's index(player's input) equal to token.
#     end

#     def position_taken?(index)
#         @board[index] == "X" || @board[index] == "O"  
#         #check to see if @board[input](player's input) is taken by saying "Is this spot taken by an X or an O? This evaluates and returns true or false"
#     end

#     def valid_move?(index)
#         if index == 0...8
#             true
#         elsif index == "X"
#             true
#         elsif index == "O"
#             true
#         else
#             false  
#         end
#         # Check if the position on the board is taken. (Position must be between 0 and 8 because those are the available positions on the board according to array indexes. Then check to see if the position has either an X or a O. If all of these conditions evaluate to false, then it is a valid move.)
#     end

#     def turn_count
#         @board.count { |token| token == "X" || token == "O" }
#     end

#     def current_player
#         turn_count % 2 == 0 ? "X" : "O"
#     end


#     def turn
#         puts "Make your move, enter 1 - 9:"
#         input = gets.strip 
#         index = input_to_index(input)
#         token = current_player
#         if valid_move?(index)
#             move(index, token)
#             display_board
#         else
#             puts "Make your move, enter 1 - 9:"
#             input = gets.strip 
#         end  
#     end

#     def won?
#     WIN_COMBINATIONS.detect do |win_combo|
#         if position_taken?(win_combo[0])
#             @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[1]] == @board[win_combo[2]] 
#         else
#             false 
#         end
#     end
            

#         # if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
#         #     return win_combo
#         # elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
#         #     return win_combo
#         # end
#         #     false
#         # end
#         # Go through every array in WIN_COMBINATIONS, then go through each element of each array and check if all three elements in each array match either "X" or "O".
#     end

#     def full?
#         @board.all? { |used| used != " " }
#         #Check to see if each element in the array is something different than empty.
#     end

#     def draw?
#          !won? && full?
#         #  Check if the game is not won && the board is full, then it's a draw 
#     end

#     def over?
#         won? || full? || draw?  
#         # checks if #won? evaluates to true or false, or if board is full, or if it's a draw
#     end

#     def winner
#         WIN_COMBINATIONS.detect do |win_combo|
#             if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
#               return "X"
#             elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
#               return "O"
#             else
#               nil
#           end
#         end
#     end

    

#     def play
#         until over?
#             turn 
#         end
#         puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#     end

    


# end


class TicTacToe

    def initialize(board = nil)
      @board = Array.new(9, " ")
    end
    
    WIN_COMBINATIONS = [
      [0,1,2], #top row
      [3,4,5], #middle row
      [6,7,8], #bottom row
      [0,3,6], #left column
      [1,4,7], #middle column
      [2,5,8], #right column
      [0,4,8], #diagonal 1
      [2,4,6] #diagonal 2
    ]
    
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
    
      def move(position, char)
        @board[position] = char
      end
    
      def position_taken?(index_i)
        ((@board[index_i] == "X") || (@board[index_i] == "O"))
      end
    
      def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
      end
    
    
    
      def turn_count
        number_of_turns = 0
        @board.each do |space|
        if space == "X" || space == "O"
            number_of_turns += 1
        end
      end
      return number_of_turns
    end
    
    
      def current_player
        if turn_count % 2 == 0
        "X"
        else
        "O"
      end
    end
    
    
    def turn
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
        token = current_player
        if valid_move?(index)
          move(index, token)
          display_board
        else
          turn
        end
    end
    
    
    def won?
      WIN_COMBINATIONS.detect do |win_combo|
        if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
          return win_combo
        elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
          return win_combo
        end
          false
      end
    end
    
    
    def full?
      @board.all? { |used| used != " "}
    end
    
    
    def draw?
      !(won?) && (full?)
    end
    
    
    def over?
      won? || full? || draw?
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


