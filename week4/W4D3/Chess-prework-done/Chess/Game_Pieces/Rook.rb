require_relative "./Piece.rb"

class Rook < Piece
    def initialize(color, pos)
        # super note: without parameters, it will try to take all of the
        # parameters passed into the initialize method and try to pass 
        #them to the superclass's version of the initialize
        super 
    end

    def symbol

    end

    protected
    def move_dirs

    end

end