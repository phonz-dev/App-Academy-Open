def sum_to(n)
    return nil if n <= 0
    return 1 if n == 1
    n + sum_to(n - 1)
end

def add_numbers(nums_array)
    return nums_array.first if nums_array.length <= 1
    nums_array.first + add_numbers(nums_array.drop(1))
end

def gamma_fnc(n)
    return nil if n == 0
    return 1 if n == 1
    gamma_fnc(n - 1) * (n - 1)
end

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    return true if flavors.first == favorite
    ice_cream_shop(flavors.drop(1), favorite)
end

def reverse(string)
    return "" if string.length == 0
    reverse(string[1..-1]) + string[0]
end