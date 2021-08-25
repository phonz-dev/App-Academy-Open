require_relative "piece"

class Board
    attr_reader :rows

    STARTING_POSITIONS = [
        [0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
        [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
        [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
        [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]
    ].freeze

    def initialize
        @rows = Array.new(8) { Array.new(8) { nil } }
        place_pieces
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @rows[row][col] = val
    end

    def place_pieces
        STARTING_POSITIONS.each { |pos| self[pos] = Piece.new }
    end
end
