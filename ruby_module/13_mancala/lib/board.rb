require "byebug"

class Board
  attr_accessor :cups

  PLAYER_ONE_STORE = 6
  PLAYER_TWO_STORE = 13
  STORES = [PLAYER_ONE_STORE, PLAYER_TWO_STORE]

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14)
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |idx|
      cups[idx] = STORES.include?(idx) ? [] : Array.new(4, :stone)
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(0, 13)
      raise "Invalid starting cup"
    end

    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    next_pos = start_pos

    until cups[start_pos].empty?
      next_pos = (next_pos += 1) % size
      
      next if current_player_name == @name1 && next_pos == PLAYER_TWO_STORE

      next if current_player_name == @name2 && next_pos == PLAYER_ONE_STORE

      cups[next_pos] << cups[start_pos].pop
    end
    render
    next_turn(next_pos)
  end

  def size
    cups.size
  end

  def next_turn(ending_cup_idx)
    if !STORES.include?(ending_cup_idx) && cups[ending_cup_idx].count == 1
      :switch
    elsif STORES.include?(ending_cup_idx)
      :prompt
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

