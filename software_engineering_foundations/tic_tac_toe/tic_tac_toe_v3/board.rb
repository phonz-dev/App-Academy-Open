class Board
    private
    attr_accessor :grid

    public
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        grid[row][col] = val
    end

    def valid?(pos)
        boundary = grid.length - 1
        row, col = pos

        return false if row < 0 || col < 0
        return false if row > boundary || col > boundary
        true
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        grid.any? do |row|
            row.all? { |el| mark == el }
        end
    end

    def win_col?(mark)
        grid.transpose.any? do |col|
            col.all? { |el| mark == el }
        end
    end

    def win_diagonal?(mark)
        diagonals = Hash.new { |h, k| h[k] = [] }
        
        i = 0
        j = grid.length - 1

        while i < grid.length
            diagonals[1] << grid[i][i]
            diagonals[2] << grid[j][i]
            i += 1
            j -= 1
        end

        diagonals.values.any? do |diagonal|
            diagonal.all? { |el| mark == el }
        end
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        legal_positions.any? { |pos| empty?(pos) }
    end

    def legal_positions
        valid_positions = []
        grid.each_index do |row|
            grid.each_index do |col|
                pos = [row, col]
                if empty?(pos)
                    valid_positions << pos
                end
            end
        end
        valid_positions
    end
end