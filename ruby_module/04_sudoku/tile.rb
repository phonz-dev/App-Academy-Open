require "colorize"

class Tile
    attr_reader :value
    def initialize(value)
        @value = value
        @given = value == 0 ? false : true
    end

    def color
        given? ? :magenta : :yellow
    end

    def given?
        @given
    end

    def to_s
        value == 0 ? " " : value.to_s.colorize(color)
    end

    def value=(new_value)
        if given?
            puts "You cannot change a given value."
        else
            @value = new_value
        end
    end
end