class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.keys.include?(peg.upcase) }
  end

  def self.random(length)
    pegs = POSSIBLE_PEGS.keys
    randomized = []
    while randomized.length < length
      random_peg = pegs.sample
      randomized << random_peg
    end
    Code.new(randomized)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(pegs)
    unless Code.valid_pegs?(pegs)
      raise "invalid pegs"
    end
    @pegs = pegs.map(&:upcase) 
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |i|
      if self[i] == guess[i]
        count += 1
      end
    end
    count
  end

  def num_near_matches(guess)
    count = 0
    code_pegs = []
    guess_pegs = []

    # store unmatched pegs in new arrays
    (0...guess.length).each do |i|
      unless self[i] == guess[i]
        code_pegs << self[i]
        guess_pegs << guess[i]
      end
    end

    already_seen = []
    guess_pegs.each do |peg|
      # make sure not to count pegs that was already counted
      if code_pegs.include?(peg) && !already_seen.include?(peg)
        count += 1
        already_seen << peg
      end
    end
    count
  end

  def ==(code)
    return false unless code.length == self.length
    num_exact_matches(code) == self.length
  end
end

