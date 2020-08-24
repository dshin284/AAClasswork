require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize( board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  
  end

  def losing_node?(evaluator)
    #return false if self.children == draw?
    board.over? && board.winner == evaluator

    #if player's turn
      #self.children => board.over? && board.winner == evaluator
    #elsif opponent's turn

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    #Go through the board
    arr = []
    @board.rows.each_with_index do |row,idx1|
      row.each_with_index do |ele,idx2|
        if @board.empty?([idx1,idx2])
          prev_move_pos = [idx1,idx2]
          @board[[idx1, idx2]] = next_mover_mark
          next_mover_mark == :x ? next_mover_mark = :o : next_mover_mark = :x
          node = TicTacToeNode.new(@board.dup, next_mover_mark, prev_move_pos)
          arr << node

        end
        
      end
      
    end
    
    return arr
  end
end

#t = tic_tac_toe.node(board.new, next_move, prev_move)