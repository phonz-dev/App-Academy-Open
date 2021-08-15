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

    def place_random_bombs
        random_positions = board_positions.sample(10)
        random_positions.each { |pos| self[pos] = :B }
    end

    def bombed_positions
        board_positions.select do |pos|
            tile = self[pos]
            tile.bombed?
        end
    end

    def render
        puts "  #{(0..8).to_a.join(" ")}"
        grid.map.with_index do |row, i| 
            puts "#{i} #{row.map(&:to_s).join(" ")}"
        end
    end

    def reveal_tile(pos)
        self[pos].reveal
    end
end
