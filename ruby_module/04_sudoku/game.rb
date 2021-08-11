require_relative "board"
require_relative "tile"

class Game
    attr_reader :board

    def initialize(board = Board.from_file("puzzles/sudoku1_almost.txt"))
        @board = Board.new(board)
    end

    def play
        until board.solved?
            system("clear")
            board.render
            pos = nil
            val = nil

            until valid_position?(pos)
                prompt_position
                pos = get_position
    
                unless valid_position?(pos)
                    puts
                    puts "Invalid position."
                    pos = nil
                end
            end

            until valid_value?(val)
                prompt_value
                val = get_value
    
                unless valid_value?(val)
                    puts
                    puts "Invalid value"
                    val = nil
                end
            end
            
            board.update_position(pos, val)
        end
        system("clear")
        board.render
        puts "Congratulations! You solved the puzzle!"
    end

    def valid_position?(pos)
        row, col = pos
        (0...board.size).include?(row) &&
            (0...board.size).include?(col) &&
            (pos.length == 2)
    end

    def valid_value?(val)
        (1..board.size).include?(val)
    end

    def prompt_position
        puts "Enter a position (e.g. '4,5')"
    end

    def prompt_value
        puts "Enter a value within range 1 - 9"
    end

    def get_position
        gets.chomp.split(",").map(&:to_i)
    end

    def get_value
        gets.chomp.to_i
    end
end
