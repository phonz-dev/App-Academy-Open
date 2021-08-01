def zip(*arrays)
    height = arrays.first.length
    width = arrays.length
    zipped = []
    (0...height).each do |row|
        subarray = []
        (0...width).each do |col|
            subarray << arrays[col][row]
        end
        zipped << subarray
    end
    zipped
end

def prizz_proc(arr, prc_1, prc_2)
    procs = [prc_1, prc_2]
    arr.select do |el|
        count = procs.count { |prc| prc.call(el) }
        el if count == 1
    end
end

def zany_zip(*arrays)
    longest = longest_array(arrays)
    rows = longest.length
    cols = arrays.length
    zany_zipped = []

    (0...rows).each do |row|
        subarray = []
        (0...cols).each do |col|
            subarray << arrays[col][row]
        end
        zany_zipped << subarray
    end

    zany_zipped
end

def longest_array(arrays)
    arrays.reduce do |arr_1, arr_2|
        if arr_1.length > arr_2.length
            arr_1
        else
            arr_2
        end
    end
end

def maximum(arr, &prc)
    arr.reduce do |acc, el|
        if prc.call(acc) > prc.call(el)
            acc
        else
            el
        end
    end
end

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each do |el|
        key = prc.call(el)
        hash[key] << el
    end
    hash
end

def max_tie_breaker(arr, prc, &blk)
    arr.reduce do |acc, el|
        if blk.call(acc) > blk.call(el)
            acc
        elsif blk.call(acc) == blk.call(el)
            if prc.call(acc) >= prc.call(el)
                acc
            else
                el
            end
        else
            el
        end
    end
end

def silly_syllables(sentence)
    words = sentence.split
    new_words = words.map { |word| slice_syllables(word) }
    new_words.join(" ")
end

def slice_syllables(word)
    vowel_idx = vowel_indices(word)
    first = vowel_idx.first
    last = vowel_idx.last

    unless vowel_idx.length == 1
        word[first..last]
    else
        word
    end
end

def vowel_indices(word)
    vowels = "aeiou"
    indices = []
    word.each_char.with_index do |ch, i|
        if vowels.include?(ch)
            indices << i
        end
    end
    indices
end
