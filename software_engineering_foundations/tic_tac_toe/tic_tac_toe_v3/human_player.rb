class HumanPlayer
    attr_accessor :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        valid_position = nil
        until valid_position
            puts "Player #{mark_value}, enter two numbers representing a position in the format 'row col'"
            valid_position = gets.chomp.split.map(&:to_i)
            unless legal_positions.include?(valid_position)
                puts "position entered was invalid."
                puts "please enter another position."
                puts ""
                valid_position = nil
            end
        end
        valid_position
    end
end