require_relative "./Piece.rb"

class King < Piece
    include Stepable
    def print_class_name()
        return "King"
    end

    def symbol

    end

    protected
    def move_diffs

    end

end

