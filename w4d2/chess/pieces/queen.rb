require_relative "slideable"
require_relative "piece"

class Queen < Piece
  include Slideable
  
  def symbol
    if self.color == :W
      :♕
    else
      :♛
    end
  end
  

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end
end