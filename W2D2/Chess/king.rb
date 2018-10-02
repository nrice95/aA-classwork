require_relative "piece"
require_relative "stepable"
class King < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def symbol
    :K
  end

  protected

  def move_dirs
    king_dirs
  end

end
