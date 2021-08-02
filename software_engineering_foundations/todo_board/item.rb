class Item
    attr_accessor :title, :deadline, :description
    def self.valid_date?(date_string)
        date_parts = date_string.split("-").map(&:to_i)
        valid_months = (1..12).to_a
        valid_days = (1..31).to_a
        year = date_parts.first.to_s
        month = date_parts[1]
        day = date_parts.last
        return false unless year.length == 4
        return false unless valid_months.include?(month)
        return false unless valid_days.include?(day)
        true
    end

    def initialize(title, deadline, description)
        unless Item.valid_date?(deadline)
            raise "invalid deadline"
        end
        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(new_deadline)
        unless Item.valid_date?(new_deadline)
            raise "invalid deadline"
        end
        @deadline = new_deadline
    end
end

