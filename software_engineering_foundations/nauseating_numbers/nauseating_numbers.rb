# PHASE 1
def strange_sums(nums)
    count = 0
    nums.each_with_index do |num_1, idx_1|
        nums.each_with_index do |num_2, idx_2|
            if idx_2 > idx_1 && num_1 + num_2 == 0
                count += 1
            end
        end
    end
    count
end

def pair_product(nums, product)
    nums.each_with_index do |num_1, idx_1|
        nums.each_with_index do |num_2, idx_2|
            if idx_2 > idx_1 && num_1 * num_2 == product
                return true
            end
        end
    end
    false
end

def rampant_repeats(str, hash)
    new_str = ""
    str.each_char do |ch|
        if hash.has_key?(ch)
            new_str += ch * hash[ch]
        else
            new_str += ch
        end
    end
    new_str
end

def perfect_square?(num)
    (0..num).any? { |fact| fact * fact == num }
end

# PHASE 2
def anti_prime?(num)
    num_divisor_count = divisors_count(num)
    (1...num).all? do |other_num|
        num_divisor_count > divisors_count(other_num)
    end
end

def divisors_count(num)
    (1..num).count { |fact| num % fact == 0 }
end

def matrix_addition(matrix_1, matrix_2)
    height = matrix_1.length
    width = matrix_1.first.length
    matrices_sum = []
    (0...height).each do |row|
        subarray = []
        (0...width).each do |col|
            sum = matrix_1[row][col] + matrix_2[row][col]
            subarray << sum
        end
        matrices_sum << subarray
    end
    matrices_sum
end

def mutual_factors(*nums)
    mutual_facts = []
    all_factors = all_num_factors(nums)
    factor_counts = nums_count(all_factors)

    factor_counts.each do |fact, count|
        if count == nums.count
            mutual_facts << fact
        end
    end

    mutual_facts
end

def all_num_factors(nums)
    all_factors = []
    nums.each do |num|
        all_factors << num_factors(num)
    end
    all_factors.flatten
end

def num_factors(num)
    (1..num).select { |fact| num % fact == 0 }
end

def nums_count(nums)
    count = Hash.new(0)
    nums.each { |num| count[num] += 1 }
    count
end

def tribonacci_number(num)
    return 1 if num == 1 || num == 2
    return 2 if num == 3
    tribonacci_number(num - 1) + tribonacci_number(num - 2) + tribonacci_number(num - 3)
end

# PHASE 3
def matrix_addition_reloaded(*matrices)
    sample_length = matrices.first.length
    same_length = matrices.all? do |matrix|
        matrix.length == sample_length
    end

    return nil unless same_length

    matrices.reduce do |sum, matrix|
        matrix_addition(sum, matrix)
    end
end

def squarocol?(arr)
    row = arr.any? do |row|
        row.all? { |el| row.first == el }
    end

    col = arr.transpose.any? do |col|
        col.all? { |el| col.first == el }
    end

    row || col
end

def squaragonal?(arr)
    j = arr.length - 1
    diagonals = Hash.new { |h, k| h[k] = [] }

    arr.each_index do |i|
        diagonals["left"] << arr[i][i]
        diagonals["right"] << arr[i][j]
        j -= 1
    end

    diagonals.values.any? do |diagonal|
        diagonal.all? { |el| diagonal.first == el }
    end
end

