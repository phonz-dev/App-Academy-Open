def partition(array, num)
    less_than_num = array.select { |el| el < num }
    greater_than_num = array.select { |el| el >= num }
    [less_than_num, greater_than_num]
end

def merge(hash_1, hash_2)
    hash_1.merge(hash_2)
end

def censor(sentence, curse_words)
    words = sentence.split
    new_words = words.map do |word|
        if curse_words.include?(word.downcase)
            star_vowels(word)
        else
            word
        end
    end

    new_words.join(" ")
end

def star_vowels(word)
    vowels = "aeiou"
    new_word = ""

    word.each_char do |ch|
        if vowels.include?(ch.downcase)
            new_word += "*"
        else
            new_word += ch
        end
    end

    new_word
end

def power_of_two?(num)
    product = 1
    while product < num
        product *= 2
    end
    product == num
end
