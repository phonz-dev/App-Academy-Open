def select_even_nums(arr)
    arr.select { |num| num.even? }
end

def reject_puppies(dogs)
    dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |subarray| subarray.sum > 0 }
end

def aba_translate(word)
    translated = ""

    word.each_char do |ch|
        if "aeiou".include?(ch)
            translated += ch + "b" + ch
        else
            translated += ch
        end
    end

    translated
end

def aba_array(words)
    words.map { |word| aba_translate(word) }
end