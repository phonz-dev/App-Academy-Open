def is_prime?(num)
    return false if num < 2
    (2...num).none? { |fact| num % fact == 0 }
end

def nth_prime(num)
    prime_count = 0
    factor = 0
    until prime_count == num
        factor += 1
        prime_count += 1 if is_prime?(factor)
    end
    factor
end

def prime_range(min, max)
    (min..max).select { |num| is_prime?(num) }
end