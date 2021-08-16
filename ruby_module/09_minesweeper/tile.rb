require_relative "board"

class Tile
    attr_reader :bomb, :flag, :reveal, :value, :board

    def initialize
        @bomb = false
        @flag = false
        @reveal = false
        @value = :_
        @board = Board.new
    end

    def bombed?
        bomb
    end

    def flagged?
        flag
    end

    def revealed?
        @reveal
    end

    def reveal
        @reveal = true
    end

    def value=(new_value)
        @value = new_value

        case value
        when :B
            @bomb = true
        when :F
            @flag = true
        end
    end

    def to_s
        revealed? ? value : "*"
    end

    def adjacent_left_tile(pos)
        row, col = pos
        [row, col + 1] unless col >= (board.length - 1)
    end

    def adjacent_right_tile(pos)
        row, col = pos
        [row, col - 1] unless col == 0
    end

    def adjacent_top_tile(pos)
        row, col = pos
        [row - 1, col] unless row == 0
    end

    def adjacent_bottom_tile(pos)
        row, col = pos
        [row + 1, col] unless row == (board.length - 1)
    end
end