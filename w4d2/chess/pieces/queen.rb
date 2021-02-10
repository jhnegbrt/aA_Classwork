require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable
  def symbol
    
  end

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end
end