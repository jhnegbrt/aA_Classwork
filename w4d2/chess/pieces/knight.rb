require_relative "stepable"
require_relative "piece"
class Knight < Piece

  def symbol
    if self.color == :W
      :♘
    else
      :♞
    end
  end

end