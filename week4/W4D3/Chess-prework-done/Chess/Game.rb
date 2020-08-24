require_relative "Board.rb"
require_relative "Display.rb"
require_relative "Player.rb"

class Game
    
    def initialize(board,display)
        @board = board
        @display = display
        @players = {}
        @current_player 
    end

    def play
    end

    
    private

    def notify_player
    end

    def swap_turn!
    end


end