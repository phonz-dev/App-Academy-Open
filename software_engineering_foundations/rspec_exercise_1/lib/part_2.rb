def hipsterfy(word)
    vowels = "aeiou"
    i = word.length - 1

    i.downto(0) do |i|
        if vowels.include?(word[i])
           word[i] = ""
           break
        end
    end

    word
end

def vowel_counts(string)
    vowels = "aeiou"
    counts = Hash.new(0)

    string.each_char do |ch|
        if vowels.include?(ch.downcase)
            counts[ch.downcase] += 1
        end
    end

    counts
end

def caesar_cipher(message, num)
    alphabet = ("a".."z").to_a
    new_message = ""

    message.each_char.with_index do |ch, i|
        if alphabet.include?(ch)
            new_idx = (alphabet.index(ch) + num) % alphabet.length
            new_message += alphabet[new_idx]
        else
            new_message += ch
        end
    end

    new_message
end
