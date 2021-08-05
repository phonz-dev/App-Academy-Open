class Card
    
    attr_reader :face_value, :face_up

    def initialize(face_value)
        @face_value = face_value
        @face_up = true
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        face_up ? face_value : "_"
    end

    def ==(other_card)
        face_value == card_face_value(other_card)
    end

    def card_face_value(card)
        card.face_value
    end
end