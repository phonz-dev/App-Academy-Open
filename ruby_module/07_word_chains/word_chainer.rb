require 'set'

class WordChainer
    attr_reader :dictionary, :current_words, :all_seen_words

    def initialize(dictionary_file)
        @dictionary = File.readlines(dictionary_file).map(&:chomp).to_set
    end

    def adjacent_words(word)
        words = []
        same_length = same_length_words(word, dictionary)

        same_length.each_with_index do |str, i|
            (0...word.length).each do |i|
                word_fragment = slice_char(word, i)
                str_fragment = slice_char(str, i)
                
                if (word_fragment == str_fragment) && word != str
                    words << str 
                end
            end
        end

        words
    end

    def slice_char(word, index)
        word[0...index] + word[index + 1..-1]
    end

    def same_length_words(word, words)
        words.select { |str| word.length == str.length }
    end

    def run(source)
        @current_words = [source]
        @all_seen_words = {source => nil}

        until current_words.empty?
            explore_current_words
        end
    end

    def explore_current_words
        new_current_words = []
        current_words.each do |current_word|
            adjacent_current_words = adjacent_words(current_word)

            adjacent_current_words.each do |word|
                unless all_seen_words.keys.include?(word)
                    @all_seen_words[word] = current_word
                    new_current_words << word
                end
            end
        end
        
        new_current_words.each do |word|
            p  "#{word} => #{all_seen_words[word]}"
        end
        
        @current_words = new_current_words
    end
end
