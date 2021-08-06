require_relative "board"
require_relative "card"
require_relative "human_player"

class Game
    attr_reader :board, :previous_guess, :player

    def initialize(player)
        @board = Board.new 
        @player = HumanPlayer.new(player)
    end

    def play
        @previous_guess = nil
        board.populate
        board.render
        sleep(1)
        system("clear")
        board.face_cards_down

        until board.won?
            system("clear")
            board.render
            sleep(0.5)
            player.prompt
            guessed_pos = player.get_input
            make_guess(guessed_pos)
        end
        puts "You guessed all pairs!"
    end

    private
    def make_guess(pos)
        board[pos].reveal
        if previous_guess.nil?
            @previous_guess = board[pos]
            return
        else
            system("clear")
            second_guess = board[pos]
            board.render
            compare_cards(previous_guess, second_guess)
        end
        @previous_guess = nil
        sleep(1)
    end

    def compare_cards(card_1, card_2)
        # uses Board '==' method
        if card_1 == card_2
            puts "It's a match!"
        else
            puts "Try again."
            hide_cards(card_1,card_2)
        end
    end

    def hide_cards(*cards)
        cards.each { |card| card.hide }
    end
end

my_game = Game.new("Fonz")
my_game.play