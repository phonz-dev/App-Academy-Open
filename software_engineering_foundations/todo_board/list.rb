require_relative "item"

class List
    private
    attr_reader :items

    public
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false unless Item.valid_date?(deadline)
        new_item = Item.new(title, deadline, description)
        items << new_item
        true
    end

    def size
        items.size
    end

    def valid_index?(index)
        valid_indices = (0...size).to_a
        valid_indices.include?(index)
    end

    def swap(index_1, index_2)
        unless valid_index?(index_1) && valid_index?(index_2)
            return false
        else
            items[index_1], items[index_2] = items[index_2], items[index_1]
            return true
        end
    end

    def [](index)
        return nil unless valid_index?(index)
        items[index]
    end

    def priority
        items.first
    end

    def print
        puts "---------------------------------------------------"
        puts "\t\t#{@label.upcase}"
        puts "---------------------------------------------------"
        puts "Index | Item                  | Deadline   | Done"
        puts "---------------------------------------------------"
        @items.each_with_index do |item, i|
            if self[i].done == true
                puts "#{i}     | #{item.title.ljust(22)}| #{item.deadline.ljust(10)} | [✓]"
            else
                puts "#{i}     | #{item.title.ljust(22)}| #{item.deadline.ljust(10)} | [ ]"
            end
        end
        puts "---------------------------------------------------"
    end

    def print_full_item(index)
        return if !self.valid_index?(index)
        puts "------------------------------------------"
        if self[index].done == true
            puts "#{self[index].title.ljust(23)}#{self[index].deadline.ljust(15)} [✓]"
        else
            puts "#{self[index].title.ljust(23)}#{self[index].deadline.ljust(15)} [ ]"
        end
        puts "\n"
        puts "#{self[index].description}"
        puts "------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        return false unless valid_index?(index)

        amount.times do
            break if index == 0
            swap(index, index - 1)
            index -= 1
        end
        true
    end

    def down(index, amount = 1)
        return false unless valid_index?(index)

        amount.times do
            break if index == size
            swap(index, index + 1)
            index += 1
        end
        true
    end

    def sort_by_date!
        items.sort_by! { |item| item.deadline }
    end
end