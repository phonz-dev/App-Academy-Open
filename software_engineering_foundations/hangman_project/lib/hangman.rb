class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []
    @secret_word.each_char.with_index do |ch, i|
      if char == ch
        matching_indices << i
      end
    end
    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |idx| guess_word[idx] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      puts "that has already been attempted"
      false
    else
      @attempted_chars << char
      matching_indices = get_matching_indices(char)

      if matching_indices.empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, matching_indices)
      end

      true
    end
  end

  def ask_user_for_guess
    puts "Enter a char:"
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if guess_word.join == @secret_word
      puts "WIN"
      true
    else
      false
    end
  end

  def lose?
    if remaining_incorrect_guesses == 0
      puts "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      true
    else
      false
    end
  end
end
