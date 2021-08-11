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
        self[pos].value = val
    end

    def render
        puts "  #{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.map(&:to_s).join(" ")}"
        end
    end

    def solved?
        win_rows? &&
            win_cols? &&
            win_three_by_threes?
    end

    def win_rows?
       grid.all? { |row| solved_set?(row.map(&:value)) }       
    end

    def win_cols?
        grid.transpose.all? { |col| solved_set?(col.map(&:value)) }
    end

    def win_three_by_threes?
        all_three_by_threes.all? { |grid| solved_set?(grid.map(&:value)) }
    end

    def all_three_by_threes
        (0...size).map { |index| three_by_three(index, grid) }
    end

    def size
        grid.size
    end

    def three_by_three(index, set)
        x = (index / 3) * 3
        y = (index % 3) * 3
    
        (x...x + 3).each_with_object([]) do |i, arr|
            (y...y + 3).each do |j|
                arr << set[i][j]
            end
        end
    end

    def solved_set?(set)
        VALUES.all? { |val| set.include?(val) }
    end
end

puzzle = Board.from_file("puzzles/sudoku1_almost.txt")

board = Board.new(puzzle)

p board.solved?