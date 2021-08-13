require 'set'

class WordChainer
    def initialize(dictionary_file)
        @dictionary = File.readlines(dictionary_file).map(&:chomp).to_set
    end

    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}
        puts "Loading dictionary..."
        sleep(1)
        puts "Building chain..."
        until current_words.empty? || all_seen_words.include?(target)
            explore_current_words 
        end
        build_path(target)
    end
    
    private
    attr_reader :dictionary, :current_words, :all_seen_words
    def adjacent_words(word)
        words = []
        # collect words of the same length from the dictionary,
        # with the 'word' argument
        all_same_length_words = same_length_words(word, dictionary)

        all_same_length_words.each_with_index do |str, i|
            (0...word.length).each do |i|
                # collect words that are one position different
                # from 'word.' To accomplish this, I opt to
                # slicing one position of char at a time from
                # both 'word' and 'str', comparing what remains.
                # If both fragments are equal, then 'str' is
                # indeed one position different from 'word'

                word_fragment = slice_char(word, i)
                str_fragment = slice_char(str, i)         
                words << str if word_fragment == str_fragment
            end
        end

        words
    end

    def slice_char(word, index)
        word[0...index] + word[index + 1..-1]
    end

    def same_length_words(word, words)
        words.select do |str| 
            word.length == str.length &&
                word != str
        end
    end

    def explore_current_words
        new_current_words = []
        current_words.each do |current_word|
            adjacent_current_words = adjacent_words(current_word)

            adjacent_current_words.each do |word|
                unless all_seen_words.has_key?(word)
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
        reversed_seen_words.each do |new_word, new_word_source|
            path.each do |word|
                path << new_word_source if word == new_word
            end
        end
        puts path.reverse.compact
    end
end

if __FILE__ == $PROGRAM_NAME
    source = ARGV[0]
    target = ARGV[1]
    chainer = WordChainer.new("dictionary.txt")
    chainer.run(source, target)
end