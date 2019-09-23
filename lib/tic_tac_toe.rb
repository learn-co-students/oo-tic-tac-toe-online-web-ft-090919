class TicTacToe
    WIN_COMBINATIONS =[
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

    def input_to_index(input)
        input = input.to_i - 1
    end

    def move(position, player)
        @board[position] = player
    end

    def position_taken?(position)
        if @board[position] == "X" || @board[position] == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(position)
        if position_taken?(position) || !position.between?(0, 8)
            return false
        else
            return true
        end
    end

    def turn
        puts "Enter a position between 1-9"
        input = input_to_index(gets.chomp)
        until valid_move?(input)
            puts "Please enter a valid move"
            input = input_to_index(gets.chomp)
        end
        move(input, current_player)
        display_board
    end

    def turn_count
        @board.select.with_index { |value, position| position_taken?(position) }.count
    end

    def current_player
        return "X" if turn_count.even?
        return "O" if turn_count.odd?
    end

    def won?
        WIN_COMBINATIONS.find do |win_case|
            position_taken?(win_case[0]) && @board[win_case[0]] == @board[win_case[1]] && @board[win_case[0]] == @board[win_case[2]]
        end
    end

    def full?
        return true if turn_count == @board.count
    end

    def draw?
        return true if !won? && full?
        return false if won?
        return false if !won? && !full?
    end

    def over?
        return true if draw? || won?
        return false if !full?
    end

    def winner
        if won?
            return @board[won?[0]]
        end
    end

    def play
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