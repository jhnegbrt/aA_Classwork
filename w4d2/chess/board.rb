class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
  end

  #populate_board

  def populate_board
    self[0, 0] = SlideablePiece.new(args) #Rook
    self[0, 1] = SteppingPiece.new(args)  #Knight
    self[0, 2] = SlideablePiece.new(args) #Bishop
    self[0, 3] = SlideablePiece.new(args) #Queen
    self[0, 4] = SteppingPiece.new(args)  #King
    self[0, 5] = SlideablePiece.new(args) #Bishop
    self[0, 6] = SteppingPiece.new(args)  #Knight
    self[0, 7] = SlideablePiece.new(args) #Rook
  
    @rows[2..5].each do |row|
      row.map! {|pos| NullPiece.instance }
    end

    self[7, 0] = SlideablePiece.new(args) #Rook
    self[7, 1] = SteppingPiece.new(args)  #Knight
    self[7, 2] = SlideablePiece.new(args) #Bishop
    self[7, 3] = SteppingPiece.new(args)  #King
    self[7, 4] = SlideablePiece.new(args) #Queen
    self[7, 5] = SlideablePiece.new(args) #Bishop
    self[7, 6] = SteppingPiece.new(args)  #Knight
    self[7, 7] = SlideablePiece.new(args) #Rook
  end

  # (3..6) rows to initialize nullpiece
  
  def [](pos)
    row, col = pos
    @rows[row][col]
  end
  
  def []=(pos, val)
    row, col = pos
    @rows[row][col] = val
  end

  def move_piece(color, start_pos, end_pos)

  end

end