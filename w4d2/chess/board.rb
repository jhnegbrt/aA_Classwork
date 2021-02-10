class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
  end

  #populate_board

  def populate_board
    self = Rook.new(  :W, self, [0, 0])
    self = Knight.new(:W, self, [0, 1])
    self = Bishop.new(:W, self, [0, 2])
    self = Queen.new( :W, self, [0, 3])
    self = King.new(  :W, self, [0, 4])
    self = Bishop.new(:W, self, [0, 5])
    self = Knight.new(:W, self, [0, 6])
    self = Rook.new(  :W, self, [0, 7])
  
    @rows[1].map! { |pos| Pawn.new }

    @rows[2..5].each do |row|
      row.map! {|pos| NullPiece.instance }
    end

    @rows[6].map! { |pos| Pawn.new }
  
    self = Rook.new(  :B, self, [7, 0])
    self = Knight.new(:B, self, [7, 1])
    self = Bishop.new(:B, self, [7, 2])
    self = King.new(  :B, self, [7, 3])
    self = Queen.new( :B, self, [7, 4])
    self = Bishop.new(:B, self, [7, 5])
    self = Knight.new(:B, self, [7, 6])
    self = Rook.new(  :B, self, [7, 7])
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