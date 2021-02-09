require_relative "piece"
class Pawn < Piece

  
  def symbol
    if self.color == :W
      :♙
    else
      :♟
    end
  end
  

end