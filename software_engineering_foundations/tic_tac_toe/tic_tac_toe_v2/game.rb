require_relative "board"
require_relative "human_player"

class Game
    attr_reader :players, :current_player, :board
    def initialize(board_size, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
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
            pos = current_player.get_position
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