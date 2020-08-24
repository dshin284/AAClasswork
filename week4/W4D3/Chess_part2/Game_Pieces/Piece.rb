require_relative "../Modules/Slideable.rb"
require_relative "../Modules/Stepable.rb"

class Piece
    attr_reader :color
    def initialize(color, board, pos)
        @color = color
        @pos = pos
        @board = board
    end

    def to_s

    end

    def empty?

    end

    def valid_moves
    end

    def pos=(val)

    end

    def symbol

    end

    private
    def move_into_check?(end_pos)

    end


end