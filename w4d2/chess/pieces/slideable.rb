require "byebug"

module Slideable

  HORIZONTAL_DIRS = [
    [-1, 0],
    [ 1, 0],
    [ 0, 1],
    [ 0,-1],
  ]
  DIAGONAL_DIRS = [
    [-1,-1],
    [ 1, 1],
    [-1, 1],
    [ 1,-1],
  ]
  attr_reader :DIAGONAL_DIRS, :HORIZONTAL_DIRS
  def moves
    moves = []
    self.move_dirs.each do |dir|
      dx, dy = dir
      moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    moves
  end

  private 
  def move_dirs
    raise NotImplementedError
  end
 
  def grow_unblocked_moves_in_dir(dx, dy)

    position = self.pos.dup
    move_dir = []
    i = [dx, dy]
    position = [(i[0] + position[0]), (i[1] + position[1])]
    
    while @board.valid_pos?(position, self.color)
      move_dir << position
      break if !@board[position].is_a?(NullPiece) && @board[position].color != self.color
      position = [(i[0] + position[0]), (i[1] + position[1])]
    end
    move_dir
  end


end