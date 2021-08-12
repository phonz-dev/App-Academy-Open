require 'set'

class WordChainer
    attr_reader :dictionary

    def initialize(dictionary_file)
        @dictionary = File.readlines(dictionary_file).map(&:chomp).to_set
    end

    def adjacent_words(word)
        dictionary.select do |adj_word|
            word.length == adj_word.length &&
                word[1..-1] == adj_word[1..-1]
        end
    end
end
