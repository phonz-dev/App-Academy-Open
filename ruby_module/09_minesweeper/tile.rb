class Tile
    attr_reader :bomb, :flag, :reveal, :value, :board

    def initialize(board)
        @bomb = false
        @flag = false
        @reveal = false
        @value = :_
        @board = board
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

    def adjacent_bottom_right(pos)
        row, col = pos
        right = adjacent_right_tile(pos)
        bottom_right = adjacent_bottom_tile(right)
        bottom_right unless col == (board.length - 1)
    end

    def adjacent_bottom_left(pos)
        row, col = pos
        left = adjacent_left_tile(pos)
        adjacent_bottom_tile(left) unless col == 0
    end

    def adjacent_right_tile(pos)
        row, col = pos
        [row, col + 1] unless col >= (board.length - 1)
    end

    def adjacent_left_tile(pos)
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
