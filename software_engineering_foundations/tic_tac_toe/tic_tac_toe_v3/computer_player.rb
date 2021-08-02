require_relative "human_player"

class ComputerPlayer < HumanPlayer
    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "Computer #{mark_value} chose position #{pos}"
        pos
    end
end