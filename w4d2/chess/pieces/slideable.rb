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
    self.move_dirs
  end

  private 
  def move_dirs; end

  def grow_unblocked_moves_in_dir(dx, dy)

  end
end