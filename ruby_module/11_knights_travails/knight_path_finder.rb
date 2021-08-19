require_relative "poly_tree_node"

class KnightPathFinder
    attr_reader :root_node, :considered_positions

    POSITION_MAPPER = [
        [1,2],
        [-1,2],
        [1,-2],
        [-1,-2],
        [2,1],
        [2,-1],
        [-2,1],
        [-2,-1]
    ]

    def self.valid_moves(pos)
        row, col = pos
        valid_positions = []
        POSITION_MAPPER.each do |(r1, c1)|
            new_row = row + r1
            new_col = col + c1
            if KnightPathFinder.valid_pos?(new_row, new_col)
                valid_positions << [new_row, new_col]
            end
        end
        valid_positions
    end

    def self.valid_pos?(row, col)
        board_range = (0..7).to_a
        board_range.include?(row) &&
            board_range.include?(col)
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos).reject do |pos|
            considered_positions.include?(pos)
        end
        considered_positions.concat(moves)
        moves
    end
end
