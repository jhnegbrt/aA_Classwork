require_relative "slideable"
require_relative "piece"
class Bishop < Piece

  def symbol
    if self.color == :W
      :♗
    else
      :♝
    end
  end

end