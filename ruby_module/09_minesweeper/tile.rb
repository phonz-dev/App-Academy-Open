class Tile
    attr_reader :bomb, :flag, :reveal, :value

    def initialize(value = "_")
        @bomb = value == :B ? true : false
        @flag = value == :F ? true : false
        @reveal = false
        @value = value
    end

    def bombed?
        bomb
    end

    def flagged?
        flag
    end

    def revealed?
        @reveal
    end

    def reveal
        @reveal = true
    end

    def value=(new_value)
        @value = new_value
    end

    def to_s
        revealed? ? value : "*"
    end
end
