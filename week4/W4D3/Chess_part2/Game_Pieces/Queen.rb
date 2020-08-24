require_relative "./Piece.rb"

class Queen < Piece
    include Slideable
    
    def initialize(color, pos)
        super
    end

    def symbol

    end

    protected
    def move_dirs

    end

end