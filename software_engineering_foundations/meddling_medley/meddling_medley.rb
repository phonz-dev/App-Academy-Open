# PHASE 1
def duos(str)
    count = 0
    (0...str.length - 1).each do |i|
        count += 1 if str[i] == str[i + 1]
    end
    count
end

def sentence_swap(sentence, hash)
    words = sentence.split
    new_words = words.map do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    new_words.join(" ")
end

def hash_mapped(hash, prc, &blk)
    mapped = {}
    hash.each do |k, v|
        key = blk.call(k)
        value = prc.call(v)
        mapped[key] = value
    end
    mapped
end

def counted_characters(str)
    char_counts = Hash.new(0)
    str.each_char { |ch| char_counts[ch] += 1 }
    char_counts.select { |ch, count| count > 2 }.keys
end

def triplet_true?(str)
    i = 0
    while i < str.length
        char = str[i]
        count = 0
        while char == str[i]
            count += 1
            i += 1
        end
        return true if count >= 3
    end
    false
end

def energetic_encoding(str, hash)
    new_str = ""
    str.each_char do |ch|
        if hash.has_key?(ch)
            new_str += hash[ch]
        elsif ch == " "
            new_str += " "
        else
            new_str += "?"
        end
    end
    new_str
end

def uncompress(str)
    letters = []
    numbers = []
    new_str = ""

    str.each_char.with_index do |ch, i|
        if i.odd?
            numbers << ch.to_i
        else
            letters << ch
        end
    end

    numbers.each_with_index do |num, i|
        num.times { new_str += letters[i] }
    end

    new_str
end

# PHASE 2
def conjunct_select(arr, *procs)
    arr.select do |el|
        count = procs.count { |prc| prc.call(el) }
        el if count == procs.count
    end
end

def convert_pig_latin(sentence)
    words = sentence.split

    new_words = words.map do |word|
        if word.length >= 3
            pig_latin_word(word)
        else
            word
        end
    end

    new_words.join(" ")
end

def pig_latin_word(word)
    vowels = "aeiou"

    if vowels.include?(word[0].downcase)
        return word + "yay"
    end

    word.each_char.with_index do |ch, i|
        if vowels.include?(ch)
            new_word = word[i..-1] + word[0...i] + "ay"
            if word == word.capitalize
                return new_word.capitalize
            else
                return new_word
            end
        end
    end
end

def reverberate(sentence)
    words = sentence.split

    new_words = words.map do |word|
        if word.length >= 3
            reverberate_word(word)
        else
            word
        end
    end
    new_words.join(" ")
end

def reverberate_word(word)
    vowels = "aeiou"

    if vowels.include?(word[-1].downcase)
        new_word = word * 2
        if word == word.capitalize
            return new_word.capitalize
        else
            return new_word
        end        
    end

    (word.length - 1).downto(0) do |i|
        if vowels.include?(word[i].downcase)
            new_word = word + word[i..-1]
            if word == word.capitalize
                return new_word.capitalize
            else
                return new_word
            end
        end
    end
end

def disjunct_select(arr, *procs)
    arr.select do |el|
        count = procs.count { |prc| prc.call(el) }
        el if count >= 1
    end
end

def alternating_vowel(sentence)
    words = sentence.split

    new_words = words.map.with_index do |word, i|
        if i.even?
            remove_first_vowel(word)
        else
            remove_last_vowel(word)
        end
    end

    new_words.join(" ")
end

def remove_first_vowel(word)
    vowels = "aeiou"
    new_word = word.dup

    new_word.each_char.with_index do |ch, i|
        if vowels.include?(ch)
            new_word[i] = ""
            break
        end
    end

    new_word
end

def remove_last_vowel(word)
    vowels = "aeiou"
    new_word = word.dup

    (word.length - 1).downto(0) do |i|
        if vowels.include?(new_word[i])
            new_word[i] = ""
            break
        end
    end

    new_word
end

def silly_talk(sentence)
    vowels = "aeiou"
    words = sentence.split

    new_words = words.map do |word|
        last_letter = word[-1]
        if vowels.include?(last_letter)
            repeat_last_letter(word)
        else
            silly_word(word)
        end
    end

    new_words.join(" ")
end

def repeat_last_letter(word)
    word + word[-1]
end

def silly_word(word)
    vowels = "aeiou"
    new_word = ""

    word.each_char do |ch|
        if vowels.include?(ch.downcase)
            new_word += ch + "b" + ch
        else
            new_word += ch
        end
    end

    if word == word.capitalize
        new_word.capitalize
    else
        new_word
    end
end

def compress(str)
    compressed = ""
    i = 0

    while i < str.length
        char = str[i]
        count = 0
        while char == str[i]
            count += 1
            i += 1
        end

        if count > 1
            compressed += char + count.to_s
        else
            compressed += char
        end
    end

    compressed
end