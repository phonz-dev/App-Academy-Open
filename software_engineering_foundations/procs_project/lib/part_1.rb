def my_map(arr, &prc)
    mapped = []
    arr.each { |el| mapped << prc.call(el) }
    mapped
end

def my_select(arr, &prc)
    selected = []
    arr.each { |el| selected << el if prc.call(el) }
    selected
end

def my_count(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count
end

def my_any?(arr, &prc)
    arr.each do |el|
        return true if prc.call(el)
    end
    false
end

def my_all?(arr, &prc)
    arr.each do |el|
        return false unless prc.call(el)
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |el|
        return false if prc.call(el)
    end
    true
end