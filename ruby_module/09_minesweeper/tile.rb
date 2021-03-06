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

    def neighbors(pos)
        [
            adjacent_top_left(pos),
            adjacent_top_tile(pos),
            adjacent_top_right(pos),
            adjacent_left_tile(pos),
            adjacent_right_tile(pos),
            adjacent_bottom_left(pos),
            adjacent_bottom_tile(pos),
            adjacent_bottom_right(pos)
    ].compact
    end

    def adjacent_top_right(pos)
        row, col = pos
        right = adjacent_right_tile(pos)
        unless col == (board.length - 1) || row == 0
            adjacent_top_tile(right)
        end
    end

    def adjacent_top_left(pos)
        row, col = pos
        left = adjacent_left_tile(pos)
        unless col == 0 || row == 0
            adjacent_top_tile(left)
        end
    end

    def adjacent_bottom_right(pos)
        row, col = pos
        right = adjacent_right_tile(pos)
        unless col == (board.length - 1) || row == (board.length - 1)
            adjacent_bottom_tile(right)
        end
    end

    def adjacent_bottom_left(pos)
        row, col = pos
        left = adjacent_left_tile(pos)
        unless col == 0 || row == (board.length - 1)
            adjacent_bottom_tile(left)
        end
    end

    def adjacent_right_tile(pos)
        row, col = pos
        [row, col + 1] unless col == (board.length - 1)
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
