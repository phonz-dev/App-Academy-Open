require_relative "tile"

class Board
    attr_reader :grid

    VALUES = (1..9).to_a

    def self.empty_board
        Array.new(9) do
            Array.new(9) { Tile.new(0) }
        end
    end

    def self.from_file(file)
        rows = File.readlines(file).map(&:chomp)
        rows.map! do |row|
            nums = row.split("").map(&:to_i)
            nums.map { |num| Tile.new(num) }
        end
        rows
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
        @grid[row][col] = val
    end

    def update_position(pos, val)
        self[pos] = val
    end

    def render
        puts "  #{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.map(&:to_s).join(" ")}"
        end
    end

    def win_rows?
       grid.all? { |row| complete_values?(row.map(&:value)) }       
    end

    def win_cols?
        grid.transpose.all? { |col| complete_values?(col.map(&:value)) }
    end

    def complete_values?(row)
        VALUES.all? { |val| row.include?(val) }
    end
end