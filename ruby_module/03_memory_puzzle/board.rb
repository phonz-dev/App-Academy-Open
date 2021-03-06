require_relative "card"

class Board
    attr_reader :grid

    ALPHABET = ("A".."Z").to_a

    def initialize
        @grid = Array.new(4) { Array.new(4) }
    end

    def populate
        while empty_positions?
            pair_positions = available_positions.sample(2)
            random_card_val = ALPHABET.sample

            if valid_card_value?(random_card_val)
                add_card_pair(random_card_val, pair_positions)
            end
        end
        nil
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end
    
    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def won?
        grid.flatten.none? { |card| card.to_s == " " }
    end

    def reveal(pos)
        self[pos].reveal
        self[pos]
    end

    def face_cards_down
        board_positions.each { |pos| self[pos].hide }
        nil
    end

    def render
        puts "\s\s#{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.join(" ")}"
        end
        nil
    end

    private
    def empty_positions?
        board_positions.any? { |pos| valid_position?(pos) }
    end

    def available_positions
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
        self[pos].nil?
    end

    def valid_card_value?(val)
        grid.flatten.none? { |card| card.to_s == val }
    end

    def add_card_pair(card_val, positions)
        positions.each { |pos| add_card(card_val, pos) }
    end

    def add_card(value, pos)
        self[pos] = Card.new(value)
    end
end