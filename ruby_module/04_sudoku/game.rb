require_relative "board"

class Game
    attr_reader :board

    def initialize(board = Board.new)
        @board = board
    end

    def play
        until board.solved?
            board.render
            pos = nil

            until valid_position?(pos)
                prompt_position
                pos = get_position

                unless valid_position?(pos)
                    puts "Invalid position."
                end
            end
        end
    end

    def valid_position?(pos)
        row, col = pos
        (0...board.size).include?(row) &&
            (0...board.size).include?(col)
    end

    def valid_value?(val)
        (0...board.size).include?(val)
    end

    def prompt_position
        puts "Enter a position (e.g. '4,5')"
    end

    def get_position
        gets.chomp.split(",").map(&:to_i)
    end
end

