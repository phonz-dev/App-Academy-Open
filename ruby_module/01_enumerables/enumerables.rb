class Array
    def my_each(&prc)
        i = 0

        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each { |el| selected << el if prc.call(el) }
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each { |el| rejected << el unless prc.call(el) }
        rejected
    end

    def my_any?(&prc)
        self.my_each { |el| return true if prc.call(el) }
        false
    end

    def my_all?(&prc)
        self.my_each { |el| return false unless prc.call(el) }
        true
    end

    def my_flatten
        flattened = []
        self.my_each do |el|
            if el.is_a?(Array)
                flattened.concat(el.my_flatten)
            else
                flattened << el
            end
        end
        flattened
    end

    def my_zip(*args)
        rows = self.length
        cols = args.length
        all_arrays = [self, *args]
        zipped = []
        (0...rows).each do |row|
            subarray = []
            (0..cols).each do |col|
                subarray << all_arrays[col][row]
            end
            zipped << subarray
        end
        zipped
    end

    def my_rotate(cycle = 1)
        self.drop(cycle % self.length) + self.take(cycle % self.length)
    end

    def my_join(separator = "")
        stringed = ""
        self.my_each do |el|
            stringed += el + separator
        end
        stringed
    end

    def my_reverse
        reversed = []
        self.my_each { |el| reversed.unshift(el) }
        reversed
    end
end