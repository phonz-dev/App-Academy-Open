require_relative "card"
require "byebug"
class Board
    attr_reader :grid

    ALPHABET = ("A".."Z").to_a

    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate
        while empty_positions?
            pair_positions = legal_positions.sample(2)
            random_card_val = ALPHABET.sample
            # if valid_card_value?(random_card_val)
                add_card_pair(random_card_val, pair_positions)
            # end
        end
    end

    def legal_positions
        board_positions.select { |pos| valid_position?(pos) }
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

    def valid_position?(pos)
        self[pos] == nil
    end

    def add_card_pair(card_val, positions)
        positions.each { |pos| add_card(card_val, pos) }
    end

    def add_card(value, pos)
        self[pos] = Card.new(value)
    end

    # Bug
    # def valid_card_value?(val)
        
    # end

    def empty_positions?
        board_positions.any? { |pos| valid_position?(pos) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    
    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def render
        puts "\s\s#{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
        return
    end

    def won?
        grid.flatten.none? { |pos| pos == nil }
    end

    def reveal(guessed_pos)
        self[guessed_pos].reveal
        self[guessed_pos]
    end
end

if __FILE__ == $PROGRAM_NAME
    my_board = Board.new
    puts my_board.populate
    puts my_board.grid
    puts my_board.render
end