require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_mov_pos = prev_mov_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children

    array = []
    (0..2).each do |row|
      (0..2).each do |col|
        if @board[row][col].empty?
          array << @board[row][col]
        end
      end
    end
    
    

    node = TicTacToeNode.new

  end
end
