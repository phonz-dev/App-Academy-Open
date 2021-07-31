class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each { |row| puts row.join(" ") }
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  def attack(pos)
    if self[pos] == :S
        self[pos] = :H
        puts "you sunk my battleship!"
        true
    else
        self[pos] = :X
        false
    end
  end

  def place_random_ships
    length = @grid.length
    until num_ships == size * 0.25
        row = rand(0...length)
        col = rand(0...length)
        pos = [row, col]
        self[pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
        row.map { |col| col == :S ? :N : col }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
