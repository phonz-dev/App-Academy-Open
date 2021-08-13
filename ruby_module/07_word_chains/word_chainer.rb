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

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}
        puts "Loading dictionary..."
        sleep(1)
        puts "Building chain..."
        until current_words.empty?
            explore_current_words
        end
        build_path(target)
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
        @current_words = new_current_words
    end

    def build_path(target)
        path = [target]
        reversed_seen_words = all_seen_words.to_a.reverse.to_h
        reversed_seen_words.each do |k, v|
            path.each do |word|
                path << v if word == k
            end
        end
        puts path.reverse
    end
end

if __FILE__ == $PROGRAM_NAME
    source = ARGV[0]
    target = ARGV[1]
    chainer = WordChainer.new("dictionary.txt")
    chainer.run(source, target)
end