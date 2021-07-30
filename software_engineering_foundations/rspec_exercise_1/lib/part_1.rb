def average(*nums)
    nums.sum / nums.length.to_f
end

def average_array(nums)
    nums.sum / nums.length.to_f
end

def repeat(string, num)
    string * num
end

def yell(string)
    string.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split
    new_words = words.map.with_index do |word, i|
        i.even? ? word.upcase : word.downcase
    end
    new_words.join(" ")
end