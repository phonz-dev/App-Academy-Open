class Tile
    attr_reader :bomb, :flag, :reveal, :value

    def initialize(value = "_")
        @bomb = false
        @flag = false
        @reveal = true
        @value = value

        if value == "B"
            @bomb = true
        elsif value == "F"
            @flag = true
        end
    end

    def bombed?
        bomb
    end

    def flagged?
        flag
    end

    def revealed?
        reveal
    end

    def value=(new_value)
        @value = new_value

        case value
        when "B"
            @bomb = true
        when "F"
            @flag = true
        end
    end

    def to_s
        revealed? ? value : "*"
    end
end