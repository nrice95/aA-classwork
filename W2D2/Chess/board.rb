require_relative "piece_requirements"

class Board
  attr_accessor :grid, :pieces

  def initialize
    @null_piece = NullPiece.instance
    @grid = Array.new(8){Array.new(8 , @null_piece)}
    @pieces = { white: [], black: [] }
    place_pieces(:top)
  end

  def [](pos)
    x,y = pos
    grid[x][y]
  end

  def []=(pos,val)
    x,y = pos
    grid[x][y] = val
  end

  def move_piece(color,start_pos,end_pos)
    if self[start_pos] == NullPiece
      puts "naaah"
      raise "Invalid move"
    end
  end

  def valid_pos?(pos)
    pos.none?{|el| el>7 || el<0}
  end

  def add_piece(piece,pos)
    grid[pos] = piece
  end

  def checkmate?(color)
    king_pos = find_king(color)
    king_moves = self[king_pos].moves
    trapped = king_moves.all? do |move|
      @pieces[Board.opposite_color(color)].any? do |piece|
        piece.moves.include?(move)
      end
    end
    in_check?(color) && trapped
  end

  def in_check?(color)
    king_pos = find_king(color)
    @pieces[Board.opposite_color(color)].any? do |piece|
      piece.moves.include?(king_pos)
    end
  end

  def find_king(color)
    @pieces[color].each {|piece| return piece.pos if piece.symbol == :K}
  end

  # def pieces
  #   self.pieces
  # end

  def dup
  end

  def move_piece!(color,start_pos,end_pos)
  end

private

  def place_pawns(color, row)
    grid[row].each_with_index do |sq, i|
      @pieces[color] << Pawn.new(color, self, [row,i])
    end
  end

  def place_mains(color, row)
    grid[row].each_with_index do |sq, i|
      if i == 0 || i == 7
        @pieces[color] << Rook.new(color, self, [row,i])
      elsif i == 1 || i == 6
        @pieces[color] << Knight.new(color, self, [row, i])
      elsif i == 2 || i == 5
        @pieces[color] << Bishop.new(color, self, [row, i])
      elsif i == 3
        @pieces[color] << Queen.new(color, self, [row, i])
      elsif i == 4
        @pieces[color] << King.new(color, self, [row, i])
      end
    end
  end

  def place_pieces(orientation)
    if orientation == :top
      place_mains(:white, 0)
      place_pawns(:white, 1)

      place_mains(:black, 7)
      place_pawns(:black, 6)
    else
      place_mains(:white, 7)
      place_pawns(:white, 6)

      place_mains(:black, 0)
      place_pawns(:black, 1)
    end
  end

  def self.opposite_color(color)
    return :white if color == :black
    return :black if color == :white
  end

end

require_relative "display"
if __FILE__ == $PROGRAM_NAME
  b = Board.new
  p b.pieces[:white].length
  puts
  # b[[2,3]] = b[[0,1]]
  # dis = Display.new(b)
  # dis.render
  # p b[[2,3]].moves
end
