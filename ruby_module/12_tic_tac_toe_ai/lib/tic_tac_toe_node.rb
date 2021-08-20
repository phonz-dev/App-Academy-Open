require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if board.over?
      return false if board.tied?
      return board.winner == evaluator ? false : true
    end

    if evaluator == next_mover_mark
      children.all? { |node| node.losing_node?(evaluator) }
    else
      children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
  end

  def children
    possible_moves = []
    (0...board.rows.length).each do |row|
      (0...board.rows.length).each do |col|
        pos = [row, col]
        if board.empty?(pos)
          board_dup = board.dup
          board_dup[pos] = next_mover_mark
          possible_moves << TicTacToeNode.new(board_dup, next_mover_mark == :x ? :o : :x, pos)
        end
      end
    end
    possible_moves
  end
end
