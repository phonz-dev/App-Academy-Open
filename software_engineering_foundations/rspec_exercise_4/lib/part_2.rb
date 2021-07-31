def proper_factors(num)
    (1...num).select { |fact| num % fact == 0 }
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    perfect_numbers = []
    i = 1
    until perfect_numbers.count == num
        if perfect_number?(i)
            perfect_numbers << i
        end
        i += 1
    end
    perfect_numbers
end