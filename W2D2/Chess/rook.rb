require_relative "piece"

class Rook < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    :R
  end

  protected

  def move_dirs
  end

end
