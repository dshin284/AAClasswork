require_relative "Board.rb"
require_relative "Cursor.rb"
require "colorize"


class Display
    def initialize(board)
        @board = board
        @cursor
    end

    def render
        #Should render the board
        #Should display its piece with its color.
        #Depending on the cursor pos, I should be 
        #able to display the cursor.
        #Making a small color GUI in the terminal.
        #When moving the cursor, your board should 
        #re-render.

    end


end