class Board
    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8) }
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end
end