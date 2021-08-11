require_relative "board"

class Game
    attr_reader :board

    def initialize(board = Board.new)
        @board = board
    end

    def play
        until board.solved?
            board.render
            prompt_position
        end
    end

    def within_bounds?(pos)
        row, col = pos
        (0...board.size).include?(row) &&
            (0...board.size).include?(col)
    end

    def valid_value?(val)
        (0...board.size).include?(val)
    end

    def prompt_position
        puts "Enter a position (e.g. '4,5')"
    end
end

