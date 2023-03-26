
class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6],

    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        int = string.to_i
        int = int - 1
        return int
    end

    def move(pla1, pla2)
        @board[pla1]= pla2
        @board[pla1]= pla2
    end

    def position_taken?(index)
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        if position_taken?(index) || index > 8 || index < 0
            return false
        else
            return true
        end
    end

    def turn_count
        count = 0
        @board.each do |space|
            if space == "X" or space == "O"
                count += 1
            end
        end
        return count
    end

    def current_player
        x_player = 0
        o_player = 0

        @board.each do |space|
            if space == 'X'
                x_player += 1

            elsif space == 'O'
                o_player += 1
            end
        end
        if x_player == o_player
            return 'X'
        end
        return 'O'
    end

    def turn
        pla_turn = gets

        index = self.input_to_index(pla_turn)
        v_move = self.valid_move? (index)
        c_players = self.current_player

        if v_move
            @board[index] = c_players
            return display_board
        else
            self.turn
        end
    end

    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[2]] != " "
                return combo
            end
        end
        return false
    end

    def full?
        @board.each do |space|
            if space == " "
                return false
            end
        end
            if self.won? == false
                return true
            end
    end

    def draw?
        if self.won? == false && self.full? == true
            return true
        end

        return false
    end

    def over?
        if self.won? || self.draw? == true
            return true
        end
        return false            
    end

    def winner
        pp @board
            if self.won? != false
                player = " "

                if self.current_player == "O"
                    player = "X"
                else
                    player = "O"
                end
                return player
            else
                return nil
            end
    end
    
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end


end