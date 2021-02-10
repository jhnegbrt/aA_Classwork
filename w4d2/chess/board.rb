require_relative './pieces/rook'
require_relative './pieces/knight'
require_relative './pieces/bishop'
require_relative './pieces/queen'
require_relative './pieces/king'
require_relative './pieces/pawn'
require_relative './pieces/null_piece'

class Board

  def initialize
    @rows = Array.new(8) {Array.new(8)}
    populate_board
  end

  #populate_board

  def populate_board
    @rows[0][0] = Rook.new(  :W, self, [0, 0])
    @rows[0][1] = Knight.new(:W, self, [0, 1])
    @rows[0][2] = Bishop.new(:W, self, [0, 2])
    @rows[0][3] = Queen.new( :W, self, [0, 3])
    @rows[0][4] = King.new(  :W, self, [0, 4])
    @rows[0][5] = Bishop.new(:W, self, [0, 5])
    @rows[0][6] = Knight.new(:W, self, [0, 6])
    @rows[0][7] = Rook.new(  :W, self, [0, 7])
  
    @rows[1].each_with_index do |pos, i| 
      @rows[1][i] = Pawn.new(:W, self, [1, i]) 
    end

    @rows[2..5].each do |row|
      row.map! {|pos| NullPiece.instance }
    end

    @rows[6].each_with_index do |pos, i| 
      @rows[6][i] =  Pawn.new(:B, self, [6, i])
    end
  
    @rows[7][0] = Rook.new(  :B, self, [7, 0])
    @rows[7][1] = Knight.new(:B, self, [7, 1])
    @rows[7][2] = Bishop.new(:B, self, [7, 2])
    @rows[7][3] = King.new(  :B, self, [7, 3])
    @rows[7][4] = Queen.new( :B, self, [7, 4])
    @rows[7][5] = Bishop.new(:B, self, [7, 5])
    @rows[7][6] = Knight.new(:B, self, [7, 6])
    @rows[7][7] = Rook.new(  :B, self, [7, 7])
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
    begin
      puts "enter starting coordinates (e.g. 0 7)"
      start_input = gets.chomp.to_i
      row, col = [start_input]
      unless self[row, col].color == color
        raise 
      end
      
      puts "enter ending coordinates (e.g. 0 7)"
      end_input = gets.chomp.to_i
      row1, col1 = [end_input]
      unless row1.between?(0..7) && col1.between?(0..7)
        raise 
      end

    rescue
      puts 'invalid position entry'
      retry
    end
    self[row1, col1] = self[row, col]
    self[row, col] = NullPiece.instance
  end

end