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
