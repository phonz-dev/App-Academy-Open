# PHASE 1
def some?(arr, &prc)
    arr.each do |el|
        return true if prc.call(el)
    end
    false
end

def exactly?(arr, num, &prc)
    trues = 0
    arr.each { |el| trues += 1 if prc.call(el) }
    trues == num
end

def filter_out(arr, &prc)
    filtered = []

    arr.each do |el|
        unless prc.call(el)
            filtered << el
        end
    end

    filtered
end

def at_least?(arr, num, &prc)
    trues = 0
    arr.each { |el| trues += 1 if prc.call(el) }
    trues >= num
end

def every?(arr, &prc)
    trues = 0
    arr.each { |el| trues += 1 if prc.call(el) }
    trues == arr.count
end

def at_most?(arr, num, &prc)
    trues = 0
    arr.each { |el| trues += 1 if prc.call(el) }
    trues <= num
end

def first_index(arr, &prc)
    arr.each_with_index do |el, i|
        return i if prc.call(el)
    end
    nil
end

# PHASE 2
def xnor_select(arr, prc_1, prc_2)
    arr.select do |el|
        both_true = prc_1.call(el) && prc_2.call(el)
        both_false = !prc_1.call(el) && !prc_2.call(el)
        both_true || both_false
    end
end

def filter_out!(arr, &prc)
    arr.each_with_index do |el, i|
        if prc.call(el)
            arr[i] = nil
        end
    end
    arr.compact!
end

def multi_map(arr, n = 1, &prc)
    mapped = []
    arr.each do |el|
        n.times { el = prc.call(el) }
        mapped << el
    end
    mapped
end

def proctition(arr, &prc)
    trues = arr.select { |el| prc.call(el) }
    falses = arr.select{ |el| !prc.call(el) }
    trues.concat(falses)
end

# PHASE 3
def selected_map!(arr, prc_1, prc_2)
    arr.each_with_index do |el, i|
        if prc_1.call(el)
            arr[i] = prc_2.call(el)
        end
    end
    nil
end

def chain_map(val, procs)
    procs.each { |prc| val = prc.call(val) }
    val
end

def proc_suffix(sentence, hash)
    words = sentence.split
    words.each_with_index do |word, i|
        hash.each do |prc, suffix|
            if prc.call(word)
                words[i] += suffix
            end
        end
    end
    words.join(" ")
end

def proctition_platinum(arr, *procs)
    procs_vals = {}
    procs.each_index { |i| procs_vals[i + 1] = [] }
    arr.each do |el|
        procs.each_with_index do |prc, i|
            if prc.call(el)
                procs_vals[i + 1] << el
                break
            end
        end
    end
    procs_vals
end

def procipher(sentence, hash)
    words = sentence.split
    words.each_with_index do |word, i|
        hash.each do |prc_1, prc_2|
            if prc_1.call(word)
                words[i] = prc_2.call(words[i])
            end
        end
    end
    words.join(" ")
end

def picky_procipher(sentence, procs)
    words = sentence.split
    new_words = words.map do |word|
        key_procs = procs.keys
        matches = key_procs.select { |prc| prc.call(word) }
        if matches.length >= 1
            key_proc = matches.first
            value_proc = procs[key_proc]
            value_proc.call(word)
        else
            word
        end
    end
    new_words.join(" ")
end
