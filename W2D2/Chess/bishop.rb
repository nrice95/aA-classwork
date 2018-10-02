require_relative "piece"

class Bishop < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    :B
  end

  protected

  def move_dirs
  end

end
