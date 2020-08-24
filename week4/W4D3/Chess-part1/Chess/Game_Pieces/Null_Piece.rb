require_relative "./Piece.rb"

class NullPiece < Piece
    include Singleton
    def initialize
        @color = "Null"
        @pos = nil
    end

    def moves

    end

    def symbol

    end
end