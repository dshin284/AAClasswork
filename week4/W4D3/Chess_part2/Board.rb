require_relative "Game_Pieces/Piece.rb"
require_relative "Game_Pieces/Bishop.rb"
require_relative "Game_Pieces/King.rb"
require_relative "Game_Pieces/Knight.rb"
require_relative "Game_Pieces/Null_Piece.rb"
require_relative "Game_Pieces/Pawn.rb"
require_relative "Game_Pieces/Queen.rb"
require_relative "Game_Pieces/Rook.rb"



class Board
    attr_reader :rows

    def initialize
        @sentinel = NullPiece.instance
        @rows = Array.new(8){ Array.new(8,@sentinel)}

        #Kevin 
        #Go through the grid. @set each piece 
        #Create the piece objects.

        white_king = King.new("White",[7,4])
        white_queen = Queen.new("White",[7,3])
        white_rook_1 = Rook.new("White",[7,0])
        white_rook_2 = Rook.new("White",[7,7])
        white_bishop_1 = Bishop.new("White",[7,2])
        white_bishop_2 = Bishop.new("White",[7,5])
        white_knight_1 = Knight.new("White",[7,1])
        white_knight_2 = Knight.new("White",[7,6])
        white_pawn1 = Pawn.new("White",[6,0])
        white_pawn2 = Pawn.new("White",[6,1])
        white_pawn3 = Pawn.new("White",[6,2])
        white_pawn4 = Pawn.new("White",[6,3])
        white_pawn5 = Pawn.new("White",[6,4])
        white_pawn6 = Pawn.new("White",[6,5])
        white_pawn7 = Pawn.new("White",[6,6])
        white_pawn8 = Pawn.new("White",[6,7])
        
        black_king = King.new("Black", [0,4])
        black_queen = Queen.new("Black", [0,3])
        black_bishop_1 = Bishop.new("Black", [0,2])
        black_bishop_2 = Bishop.new("Black", [0,5])
        black_knight_1 = Knight.new("Black", [0,1])
        black_knight_2 = Knight.new("Black", [0,6])
        black_rook_1 = Rook.new("Black", [0,0])
        black_rook_2 = Rook.new("Black", [0,7])
        black_pawn1 = Pawn.new("Black", [1,0])
        black_pawn2 = Pawn.new("Black", [1,1])
        black_pawn3 = Pawn.new("Black", [1,2])
        black_pawn4 = Pawn.new("Black", [1,3])
        black_pawn5 = Pawn.new("Black", [1,4])
        black_pawn6 = Pawn.new("Black", [1,5])
        black_pawn7 = Pawn.new("Black", [1,6])
        black_pawn8 = Pawn.new("Black", [1,7])

        #Solution A: Put all the 32 pieces into an array and 
        #iterate through the array and place it on the board 
        #based on the board coordinates
        
        #Fill up row 0:
        rows[0][0] = black_rook_1
        rows[0][1] = black_knight_1 
        rows[0][2] = black_bishop_1
        rows[0][3] = black_queen
        rows[0][4] = black_king
        rows[0][5] = black_bishop_2
        rows[0][6] = black_knight_2
        rows[0][7] = black_rook_2
        #Fill up row 1:
        rows[1][0] = black_pawn1
        rows[1][1] = black_pawn2
        rows[1][2] = black_pawn3
        rows[1][3] = black_pawn4
        rows[1][4] = black_pawn5
        rows[1][5] = black_pawn6
        rows[1][6] = black_pawn7
        rows[1][7] = black_pawn8

        #Fill up row 6
        rows[6][0] = white_rook_1
        rows[6][1] = white_knight_1 
        rows[6][2] = white_bishop_1
        rows[6][3] = white_queen
        rows[6][4] = white_king
        rows[6][5] = white_bishop_2
        rows[6][6] = white_knight_2
        rows[6][7] = white_rook_2
        #Fill up row 7:
        rows[7][0] = white_pawn1
        rows[7][1] = white_pawn2
        rows[7][2] = white_pawn3
        rows[7][3] = white_pawn4
        rows[7][4] = white_pawn5
        rows[7][5] = white_pawn6
        rows[7][6] = white_pawn7
        rows[7][7] = white_pawn8

        #Solution B: go through only rows: 0,1,6,7 and place the 
        #pieces on the board based on 32 if-statements.
    end
    
    def [](pos)
        row = pos[0]
        col = pos[1]
        return self.rows[row][col]
    end


    def []=(pos,val)
        self.rows[pos] = val
    end

    def valid_pos?(pos)
        #end_object.color != start_object.color 
        row = pos[0]
        col = pos[1]
        if row > 7 || row < 0 || col > 7 || col < 0
            return false
        end
        return true
    end



    def add_piece(piece, pos)

    end

    

    def move_piece(start_pos, end_pos)
        raise "Invalid start position! " if !valid_pos?(start_pos)
        #Assume user
        start_object = self.rows[start_pos]
        end_object = self.rows[end_pos]
        if !start_object.is_a?(Null_Piece) && start_object.color != end_object.color && valid_pos?(start_pos) && valid_pos?(end_pos)
            #Grab the object from start_pos
            temp_obj = self.rows[start_pos]
            self.rows[end_pos] = temp_obj
        end
    end


    def checkmate?(color)

    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
        
    end


    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

    def print_board()
        rows.each do |row|
            row.each do |ele|
                print "#{ele.color[0]}_#{ele.class.name} "
            end
            puts
        end
    end
end


if __FILE__ == $0
    board = Board.new
    #puts board
    board.print_board

    cursor = Cursor.new([0,0], board)
    p cursor.read_char
end