require_relative "stepable"
require_relative "piece"
class King < Piece

  def symbol
    if self.color == :W
      :♔
    else
      :♚
    end
  end

end