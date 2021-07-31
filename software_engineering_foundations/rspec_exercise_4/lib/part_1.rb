def my_reject(arr, &prc)
    rejected = []
    arr.each do |el|
        unless prc.call(el)
            rejected << el
        end
    end
    rejected
end

def my_one?(arr, &prc)
    trues = arr.count { |el| prc.call(el) }
    trues == 1
end

def hash_select(hash, &prc)
    selected = {}
    hash.each do |k, v|
        if prc.call(k, v)
            selected[k] = v
        end
    end
    selected
end

def xor_select(arr, prc_1, prc_2)
    arr.select do |el|
        count = 0
        count += 1 if prc_1.call(el)
        count += 1 if prc_2.call(el)
        el if count == 1
    end
end

def proc_count(val, procs)
    procs.count { |prc| prc.call(val) }
end
