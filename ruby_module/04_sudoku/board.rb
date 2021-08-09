require_relative "tile"


class Board
    attr_reader :grid

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

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def update_position(pos, val)
        self[pos] = val
    end

    def render
        puts "\s\s#{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.map(&:to_s).join(" ")}"
        end
    end
end