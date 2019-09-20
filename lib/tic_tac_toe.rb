class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # center column
    [2,5,8], # right column
    [0,4,8], # left-right diaganoal
    [2,4,6]  # right-left diagonal
    ]

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(user_input)
        board_index = user_input.to_i - 1
    end

    def move(position, token = "X")
        @board[position] = token
    end

    def position_taken?(position)
        (@board[position] == "X") || (@board[position] == "O")
    end

    def valid_move?(index)
        index.between?(0,8) && (!position_taken?(index))
    end

    def turn_count
        count = 0

        @board.count { |position| 
            if position == "X" || position == "O" 
                count += 1 
            end
        }
    count
    end

    def turn
        puts "1 being top left 9 being bottom right, enter a number 1-9:"
        input = gets.strip
        index = input_to_index(input)

        if (valid_move?(index))
            token = current_player
            move(index, token)
        else
            turn
        end
    display_board
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def won?
        @win = nil #created for an instance variable 
        WIN_COMBINATIONS.detect { |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
            return combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            return combo
        else
            false
        end
        }
    end

    def full?
        bcount = 0 #board count
        board_full = false
        board.each { |element| 
            if element == "X" || element == "O"
                bcount += 1
            end
        }
        if bcount == 9
            board_full = true
        end
    board_full
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || full? || draw?
    end

    def winner
        
        WIN_COMBINATIONS.detect { |combo|
    
            if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
              return "X"
            elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
              return "O"
            else
              nil
            end
        }
    end

    def play
        while over? == false
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        else
            puts "Cat's Game!"
        end
    end
end