def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(sentence, &prc)
    words = sentence.split
    new_words = words.map { |word| prc.call(word) }
    new_words.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
    prc_1.call(num) > prc_2.call(num) ? prc_1.call(num) : prc_2.call(num)
end

def and_selector(arr, prc_1, prc_2)
    arr.select { |el| prc_1.call(el) && prc_2.call(el) }
end

def alternating_mapper(arr, prc_1, prc_2)
    arr.map.with_index do |el, i|
        i.even? ? prc_1.call(el) : prc_2.call(el)
    end
end