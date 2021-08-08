require "byebug"
# Warm up
# iterative solution
def range(start_num, end_num)
    # one line version
    # (start_num...end_num).to_a

    # version 2
    exclusive_range = []
    (start_num...end_num).each do |num|
        exclusive_range << num
    end
    exclusive_range
end

# recursive solution
def range(start_num, end_num)
    return [] if end_num <= start_num
    [start_num] + range(start_num + 1, end_num)
end

# Exponentiation version 1
def exponent(base, power)
    return 1 if power == 0
    base * exponent(base, power - 1)
end

# Exponentiation version 2
def exponent(base, power)
    return 1 if power == 0
    return base if power == 1
    if power.even?
        exponent(base, power / 2) * exponent(base, power / 2)
    else
        base * exponent(base, (power - 1) / 2) * exponent(base, (power - 1) / 2)
    end
end

# Deep dup
class Array
    def deep_dup
        copy = []
        self.each do |el|
            copy << (el.is_a?(Array) ? el.deep_dup : el)
        end
        copy
    end
end

# iterative solution
def fibonacci(n)
    return [] if n == 0
    return [1] if n == 1
    seq = [1, 1]
    while seq.length < n
        seq << seq[-1] + seq[-2]
    end
    seq
end

# recursive solution
def fibonacci(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    seq = fibonacci(n - 1)
    seq << seq[-1] + seq[-2]
end

def bsearch(array, target)
    return nil if array.empty?

    mid = array.length / 2
    middle_el = array[mid]
    left_half = array[0...mid]
    right_half = array[mid + 1..-1]
    
    if target == middle_el
        mid
    elsif target < middle_el
        bsearch(left_half, target)
    else
        ans = bsearch(right_half, target)
        ans.nil? ? nil : (mid + 1) + ans
    end
end

def merge_sort(array)
    return array if array.length < 2
    
    mid_point = array.length / 2
    left_half = array.take(mid_point)
    right_half = array.drop(mid_point)

    sorted_left = merge_sort(left_half)
    sorted_right = merge_sort(right_half)

    merge(sorted_left, sorted_right)
end

def merge(left, right)
    merged = []
    debugger
    until left.empty? || right.empty?
        merged << (left.first < right.first ? left.shift : right.shift)
    end
    debugger
    merged + left + right
end

