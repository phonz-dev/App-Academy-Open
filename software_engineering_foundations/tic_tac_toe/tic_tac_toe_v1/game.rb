require_relative "board"
require_relative "human_player"

class Game
    attr_reader :player_1, :player_2, :current_player, :board
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = player_1
        @board = Board.new
    end

    def switch_turn
        if current_player == player_1
            @current_player = player_2
        else
            @current_player = player_1
        end
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