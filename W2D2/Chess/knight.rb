require_relative "piece"
require_relative "stepable"

class Knight < Piece
  include Stepable
  def initialize(color, board, pos)
    super
  end

  def symbol
    :N
  end

  protected

  def move_dirs
    knight_dirs
  end



end
