require_relative "piece"

class Queen < Piece
  def initialize(color, board, pos)
    super
  end

  def symbol
    :Q
  end

  protected

  def move_dirs
  end

end
