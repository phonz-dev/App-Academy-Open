require_relative "tile"

class Board
    attr_reader :grid

    def self.empty_board
        Array.new(9) do
            Array.new(9) { Tile.new }
        end
    end

    def initialize(grid = Board.empty_board)
        @grid = grid
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        tile = grid[row][col]
        tile.value = val
    end
end
