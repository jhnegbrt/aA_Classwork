class Piece

  

  def initialize(symbol, pos)
    @color = symbol
    @board = Board.
    @pos = pos
  end

end

class NullPiece < Piece

  def initialize
  end

end