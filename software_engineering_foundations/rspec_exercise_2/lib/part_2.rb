def palindrome?(string)
    reversed = ""
    (string.length - 1).downto(0) do |i|
        reversed += string[i]
    end
    string == reversed
end

def substrings(string)
    all_substrings = []
    
    (0...string.length).each do |from|
        (0...string.length).each do |to|
            if to >= from
                all_substrings << string[from..to]
            end
        end
    end

    all_substrings
end

def palindrome_substrings(string)
    substrings = substrings(string)
    substrings.select do |str|
        palindrome?(str) && str.length > 1
    end
end
