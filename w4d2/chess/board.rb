require "colorize"

require "byebug"
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

  def valid_pos?(position)

  end

  def move_piece(color, start_pos, end_pos)
    begin
      
      puts "enter starting coordinates (e.g. 0 7)"
      start_input = gets.chomp.split.map(&:to_i)
      unless self[start_input].color == color
        raise 
      end
      
      puts "enter ending coordinates (e.g. 0 7)"
      end_input = gets.chomp.split.map(&:to_i)
      if !end_input[0].between?(0, 7) || !end_input[1].between?(0, 7)
        raise 
      end

      self[end_input] = self[start_input]
      self[start_input] = NullPiece.instance

    rescue
      puts 'invalid position entry'
      retry
    end

  end

  

  def print_board
    grid = @rows.map do |row|
      row.map do |pos|
        if pos.is_a?(NullPiece)
          :_ 
        elsif pos.color == :W
          pos.symbol.to_s.colorize(:blue)
        else
          pos.symbol.to_s.colorize(:yellow)
        end
      end
    end
    grid.each do |row|
      puts row.join(" ")
    end
  end

end
puts "colorize works ♚".colorize(:green)
b = Board.new
# p b
b.print_board
