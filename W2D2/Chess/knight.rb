require_relative "piece"

class Knight < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    :N
  end

  protected

  def move_dirs
  end

end
