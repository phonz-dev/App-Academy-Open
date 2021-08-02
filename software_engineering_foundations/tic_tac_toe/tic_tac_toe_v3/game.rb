require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
    attr_reader :players, :current_player, :board
    def initialize(board_size, marks)
        @players = []
        marks.each do |mark, computer|
            if computer
                players << ComputerPlayer.new(mark)
            else
                players << HumanPlayer.new(mark)
            end
        end
        @current_player = players.first
        @board = Board.new(board_size)
    end

    def switch_turn
        players.rotate!
        @current_player = players.first
    end

    def play
        while board.empty_positions?
            board.print
            puts ""
            pos = current_player.get_position(board.legal_positions)
            mark = current_player.mark_value
            board.place_mark(pos, mark)

            if board.win?(mark)
                puts "--------------------"
                puts "Game Over!"
                puts "Player #{mark} wins!"
                puts "--------------------"
                return
            else
                switch_turn
            end
        end

        puts "Tie Game!"
        return
    end
end