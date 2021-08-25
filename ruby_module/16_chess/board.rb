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

    def move_piece(start_pos, end_pos)
        raise 'no piece to move' unless self[start_pos].is_a?(Piece)
        unless board_positions.include?(end_pos)
            raise 'cannot move to desired position' 
        end

        self[end_pos] = self[start_pos]
        self[start_pos] = nil
    end

    def board_positions
        (0...rows.length).map do |row|
            (0...rows.length).map { |col| [row, col] }
        end.flatten(1)
    end
end
