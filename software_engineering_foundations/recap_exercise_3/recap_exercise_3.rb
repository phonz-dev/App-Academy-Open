# GENERAL PROBLEMS
def no_dupes?(arr)
    element_counts = Hash.new(0)
    arr.each { |el| element_counts[el] += 1 }
    element_counts.select { |k, v| v == 1 }.keys
end

def no_consecutive_repeats?(arr)
    (0...arr.length - 1).each do |i|
        return false if arr[i] == arr[i + 1]
    end
    true
end

def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index do |ch, i|
        indices[ch] << i
    end
    indices
end

def longest_streak(str)
    longest = ""
    i = 0
    while i < str.length
        char = str[i]
        current = ""
        while char == str[i]
            current += char
            i += 1
        end
        if current.length >= longest.length
            longest = current
        end
    end
    longest
end

def bi_prime?(num)
    (2...num).each do |num_1|
        (2...num).each do |num_2|
            primes = prime?(num_1) && prime?(num_2)
            if primes && num_1 * num_2 == num
                return true
            end
        end
    end
    false
end

def prime?(num)
    return false if num < 2
    (2...num).none? { |i| num % i == 0 }
end

def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    new_message = ""
    message.each_char.with_index do |ch, i|
        idx = (alpha.index(ch) + keys[i % keys.length]) % alpha.length
        new_message += alpha[idx]
    end
    new_message
end

def vowel_rotate(str)
    new_str = str.dup

    str_vowels = string_vowels(str).rotate!(-1)
    vowel_indices = string_vowel_indices(str)

    vowel_indices.each_with_index do |idx_1, idx_2|
        new_str[idx_1] = str_vowels[idx_2]
    end

    new_str 
end

def string_vowels(str)
    vowels = "aeiou"
    str_vowels = []

    str.each_char do |ch|
       if vowels.include?(ch)
        str_vowels << ch
       end
    end

    str_vowels
end

def string_vowel_indices(str)
    vowels = "aeiou"
    indices = []

    str.each_char.with_index do |ch, i|
       if vowels.include?(ch)
        indices << i
       end
    end

    indices
end

# PROC PROBLEMS
class String
    def select(&prc)
        return "" if prc == nil

        new_string = ""
        self.each_char do |ch|
            if prc.call(ch)
                new_string += ch
            end
        end
        new_string
    end

    def map!(&prc)
        self.each_char.with_index do |ch, i|
            if prc.call(ch, i)
                self[i] = prc.call(ch, i)
            end
        end
        self
    end
end

# RECURSION PROBLEMS
def multiply(a, b)
    return 0 if a == 0 || b == 0
    if b < 0
        -(a + multiply(a, -b - 1))
    else
        a + multiply(a, b - 1)
    end
end

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2, 1] if length == 2

    sequence = lucas_sequence(length - 1)
    next_seq = sequence[-1] + sequence[-2]
    sequence << next_seq
end

def prime_factorization(num)
    (2...num).each do |factor|
        if num % factor == 0
            other_factor = num / 2
            return prime_factorization(factor).concat(prime_factorization(other_factor))
        end
    end
    [num]
end