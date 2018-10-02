require_relative "piece"
require "singleton"

class NullPiece < Piece
  include Singleton
  attr_reader :color
  def initialize
    @color = :none
  end

  def moves
  end

  def symbol
    :_
  end
end
