# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def largest_prime_factor(num)
    num.downto(0) do |i|
        return i if prime?(i) && num % i == 0
    end
end

def unique_chars?(string)
    string.each_char.with_index do |ch1, idx1|
        string.each_char.with_index do |ch2, idx2|
            return false if idx2 > idx1 && ch1 == ch2
        end
    end
    true
end

def dupe_indices(arr)
    dupes = Hash.new { |h, k| h[k] = [] }
    repeated_elements = repeated_elements(arr)
    arr.each_with_index do |el, i|
        if repeated_elements.include?(el)
            dupes[el] << i
        end
    end
    dupes
end

def repeated_elements(arr)
    el_counts = Hash.new(0)
    arr.each { |el| el_counts[el] += 1 }
    el_counts.select { |k, v| v > 1 }.keys
end

def ana_array(arr_1, arr_2)
    elements_1 = element_counts(arr_1)
    elements_2 = element_counts(arr_2)
    elements_1 == elements_2
end

def element_counts(arr)
    counts = Hash.new(0)
    arr.each { |el| counts[el] += 1 }
    counts
end
