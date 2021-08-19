require_relative "poly_tree_node"

class KnightPathFinder
    POSITION_MAPPER = [
        [ 1, 2],
        [-1, 2],
        [ 1,-2],
        [-1,-2],
        [ 2, 1],
        [ 2,-1],
        [-2, 1],
        [-2,-1]
    ]

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        build_move_tree
    end

    def find_path(end_pos)
        end_position = root_node.bfs(end_pos)
        trace_path_back(end_position)
    end

    private_constant :POSITION_MAPPER

    private
    attr_reader :root_node, :considered_positions

    def self.valid_moves(pos)
        row, col = pos
        valid_positions = []
        POSITION_MAPPER.each do |(r1, c1)|
            pos = [row + r1, col + c1]
            if KnightPathFinder.valid_pos?(pos)
                valid_positions << pos
            end
        end
        valid_positions
    end

    def self.valid_pos?(pos)
        row, col = pos
        board_range = (0..7).to_a
        board_range.include?(row) &&
            board_range.include?(col)
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos).reject do |pos|
            considered_positions.include?(pos)
        end
        considered_positions.concat(moves)
        moves
    end

    def build_move_tree
        queue = [root_node]
        until queue.empty?
            node = queue.shift
            moves = new_move_positions(node.value)
            moves.each do |move| 
                new_node = PolyTreeNode.new(move)
                node.add_child(new_node)
                queue << new_node
            end
        end
    end

    def trace_path_back(end_node)
        path = [end_node.value]
        current_node = end_node
        until current_node.parent.nil?
            value = current_node.parent.value
            path.unshift(value)
            current_node = current_node.parent
        end
        path
    end
end

if __FILE__ == $PROGRAM_NAME
    kpf = KnightPathFinder.new([0,0])
    p kpf.find_path([7,7])
end