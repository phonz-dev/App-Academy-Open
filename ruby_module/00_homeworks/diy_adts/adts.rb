class Stack
    def initialize
        @stack = []
    end

    def push(el)
        stack << el
    end

    def pop
        stack.pop
    end

    def peek
        stack.first
    end

    private
    attr_reader :stack
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        queue << el
    end

    def dequeue
        queue.shift
    end

    def peek
        queue.first
    end

    private
    attr_reader :queue
end

class Map
    def initialize
        @pairs = []
    end

    def set(key, value)
        pair = pairs.assoc(key)
        if pair.nil?
            pairs << [key, value]
        else
            pair[1] = value
        end
    end

    def get(key)
        pair = pairs.assoc(key)
        pair.last
    end

    def delete(key)
        pair = pairs.assoc(key)
        pairs.delete(pair)
    end

    def show
        pairs
    end

    private
    attr_reader :pairs
end
