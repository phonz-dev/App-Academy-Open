require "byebug"
require "set"
require_relative "player"

class GhostGame 
    ALPHABET = ("a".."z").to_a
    attr_reader :dictionary, :players, :fragment, :losses

    def initialize(*players)
        words = File.readlines("my_dictionary.txt").map(&:chomp)
        @dictionary = Set.new(words)
        @players = players
        @losses = {}
        players.each { |player| @losses[player] = 0 }
    end

    def run
        play_round until game_over?
    end

    def play_round
        @fragment = ""
        display_standings
        take_turn(current_player) until round_over?
        
        puts "Round over!"
        puts "#{fragment.capitalize} is a word."
        puts "#{previous_player.name} earns a letter!"
        puts ""
        
        @losses[previous_player] += 1
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

    def record(player)
        "GHOST"[0...@losses[player]]
    end

    def take_turn(player)
        player_guess = nil

        until valid_play?(player_guess)
            puts "Fragment: #{fragment}"
            puts ""
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

    def round_over?
        dictionary.include?(fragment)
    end

    def game_over?
        all_player_losses = losses.values
        all_player_losses.any? { |loss| loss == 5 }
    end

    def display_standings
        puts "----------------------------"
        puts "#{'PLAYERS'.center(8)}|#{'LOSSES'.center(8)}| #{'LETTERS'.center(8)}|"
        puts "----------------------------"
        players.each do |player|
            puts "#{player.name.center(8)}|#{losses[player].to_s.center(8)}|#{record(player).center(9)}|"
            puts "----------------------------"
        end
        sleep(2)
        system("clear")
    end
end

