require_relative "slideable"
require_relative "piece"
class Rook < Piece

  def symbol
    if self.color == :W
      :♖
    else
      :♜
    end
  end

  def move_dirs
    HORIZONTAL_DIRS
  end

end