# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "set"
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / self.count.to_f
    end

    def median
        return nil if self.empty?

        element_count = self.count
        sorted = self.sort
        mid = element_count / 2

        if element_count.odd?
            sorted[mid]
        else
            [sorted[mid], sorted[mid - 1]].average
        end
    end

    def counts
        ele_counts = Hash.new(0)
        self.each { |el| ele_counts[el] += 1 }
        ele_counts
    end

    def my_count(value)
        count = 0
        self.each { |el| count += 1 if el == value }
        count
    end

    def my_index(value)
        self.each_with_index do |el, i|
            return i if el == value
        end
        nil
    end

    def my_uniq
        self.to_set.to_a
    end

    def my_transpose
        transposed = []

        self.each_index do |row|
            same_indices = []
            self.each_index do |col|
                same_indices << self[col][row]
            end
            transposed << same_indices
        end

        transposed
    end
end