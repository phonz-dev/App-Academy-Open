require_relative "tile"
require "colorize"

class Board
    attr_reader :grid

    def self.from_file(file)
        board = []
        File.readlines(file, chomp: true).each do |line|
            row = []
            line.each_char do |tile|
                row << Tile.new(tile.to_i)
            end
            board << row
        end
        board
    end

    def initialize(grid)
        @grid = grid
    end

    def render
        puts "\s\s#{(0...grid.size).to_a.join(" ")}"
        grid.each_with_index do |row, idx|
            puts "#{idx} #{row.map(&:to_s).join(" ")}"
        end
    end

end

