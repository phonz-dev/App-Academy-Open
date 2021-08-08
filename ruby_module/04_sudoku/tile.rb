class Tile
    attr_reader :value
    def initialize(value)
        @value = value
    end

    def to_s
        value == 0 ? nil : value
    end
end