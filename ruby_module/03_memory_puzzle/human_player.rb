class HumanPlayer
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def prompt
        puts "Please enter the position of the card you'd like to flip (e.g., '3,1')"
    end

    def get_input
        gets.chomp.split(",").map(&:to_i)
    end
end