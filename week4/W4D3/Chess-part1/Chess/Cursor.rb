require_relative "Board.rb"


class Cursor

    def initialize(cursor_pos, board)
        @cursor_pos = cursor_pos
        @board = board
        @selected 
    end

    def get_input
    end

    def toggle_selected
    end

    private
    def handle_key(key)
    end

    def read_char
    end

    def update_pos(diff)
    end


end