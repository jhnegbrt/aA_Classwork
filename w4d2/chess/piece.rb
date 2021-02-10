require "Singleton"

class Piece

  

  def initialize(symbol, pos)
    @color = symbol
    @board = Board.something #halp
    @pos = pos
  end

end

class NullPiece < Piece
  include Singleton

  def initialize; end

end

class SlideablePiece
end

module Slideable
  
end


class SteppingPiece
end

module Stepable
end

class Pawn
end