

class Piece

  attr_reader :color, :board
  attr_accessor :pos
  
  def initialize(symbol, board, pos)
    @color = symbol
    @board = board
    @pos = pos
  end

  def moves
  
  end

end




