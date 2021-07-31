def element_count(arr)
    counts = Hash.new(0)
    arr.each { |el| counts[el] += 1 }
    counts
end

def char_replace!(str, hash)
    str.each_char.with_index do |ch, i|
        if hash.has_key?(ch)
            str[i] = hash[ch]
        end
    end
    str
end

def product_inject(nums)
    nums.inject { |product, num| product * num }
end