class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
  end

  #populate_board

  def populate_board
    @rows[0].each_index do |idx|
    end
  
    @rows[2..5].each do |row|
      row.map! {|pos| NullPiece.instance }
    end
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