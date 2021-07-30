def all_words_capitalized?(words)
    words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
    domain_names = ['.com', '.net', '.io', '.org']
    urls.none? do |url|
        domain_names.any? { |name| url.end_with?(name) }
    end
end

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        average_grade = grades.sum / grades.length
        average_grade >= 75
    end
end