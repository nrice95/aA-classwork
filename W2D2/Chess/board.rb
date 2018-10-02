require_relative "piece_requirements"

class Board
  attr_accessor :grid

  def initialize
    @null_piece = NullPiece.instance
    @grid = Array.new(8){Array.new(8 , @null_piece)}
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
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color,start_pos,end_pos)
  end

private

  def place_pawns(color, row)
    grid[row].each_with_index do |sq, i|
      Pawn.new(color, self, [row,i])
    end
  end

  def place_mains(color, row)
    grid[row].each_with_index do |sq, i|
      if i == 0 || i == 7
        Rook.new(color, self, [row,i])
      elsif i == 1 || i == 6
        Knight.new(color, self, [row, i])
      elsif i == 2 || i == 5
        Bishop.new(color, self, [row, i])
      elsif i == 3
        Queen.new(color, self, [row, i])
      elsif i == 4
        King.new(color, self, [row, i])
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

end
