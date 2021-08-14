require_relative "tile"

class Board

    def self.empty_board
        Array.new(9) do
            Array.new(9) { Tile.new }
        end
    end

    def initialize(grid = Board.empty_board)
        @grid = grid
    end

end

p Board.new