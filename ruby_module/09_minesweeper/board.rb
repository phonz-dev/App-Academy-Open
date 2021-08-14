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

    def board_positions
        positions = []
        grid.each_index do |row|
            grid.each_index do |col|
                positions << [row, col]
            end
        end
        positions
    end
end
