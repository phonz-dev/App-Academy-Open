require_relative "tile"

class Board
    def self.from_file(file)
        board = []
        File.readlines(file, chomp: true).each do |line|
            row = []
            line.each_char do |tile|
                row << Tile.new(tile.to_i)
            end
            board << row
        end
        board
    end

    def initialize(grid)
        @grid = grid
    end
end
