require "byebug"
require "set"
require_relative "player"

class GhostGame 
    ALPHABET = ("a".."z").to_a
    attr_reader :dictionary, :players, :fragment

    def initialize(*players)
        words = File.readlines("my_dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @fragment = ""
    end

    def current_player
        players.first
    end

    def previous_player
        players.last
    end

    def next_player!
        players.rotate!
    end

    def round_over?
        dictionary.include?(fragment)
    end

    def take_turn(player)
        player_guess = nil

        until valid_play?(player_guess)
            puts "#{player.name}'s turn:"
            player_guess = player.guess
            puts ""
            unless valid_play?(player_guess)
                puts "Invalid guess"
                puts ""
            end
        end
        next_player!
        @fragment += player_guess
    end

    def valid_play?(letter)
        return false unless ALPHABET.include?(letter)
        potential_fragment = fragment + letter
        dictionary.any? do |word|
            word.start_with?(potential_fragment)
        end
    end

    def play_round
        take_turn(current_player) until round_over?
        puts "Round over!"
        puts "#{fragment.capitalize} is a word."
        puts "#{previous_player.name} earns a letter!"
    end
end

