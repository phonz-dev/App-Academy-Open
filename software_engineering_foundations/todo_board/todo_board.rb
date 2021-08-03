require_relative "list"

class TodoBoard
    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split

        case cmd
        when "quit"
            return false
        when "mklist"
            @lists[label] = List.new(label)
        when "ls"
            @lists.keys.each { |label| puts label }
        when "showall"
            @lists.values.each { |list| list.print }
        when "mktodo"
            @lists[label].add_item(*args)
        when "up"
            @lists[label].up(*args)
        when "down"
            @lists[label].down(*args)
        when "swap"
            @lists[label].swap(*args)
        when "sort"
            @lists[label].sort_by_date!
        when "priority"
            @lists[label].print_priority
        when "print"
            if args.empty?
                @lists[label].print
            else
                @lists[label].print_full_item(*args.map(&:to_i))
            end
        when "toggle"
            @lists[label].toggle_item(*args.map(&:to_i))
        when "rm"
            @lists[label].remove_item(*args.map(&:to_i))
        when "purge"
            @lists[label].purge
        else
            puts "Sorry, that command is not recognized."
        end
        true
    end

    def run
        get_command while get_command
    end
end

TodoBoard.new.run