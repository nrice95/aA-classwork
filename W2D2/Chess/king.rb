require_relative "piece"

class King < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    :K
  end

  protected

  def move_dirs
  end

end
