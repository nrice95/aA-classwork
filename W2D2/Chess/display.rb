require "colorize"
require_relative "board"
require_relative "cursor"
class Display
  attr_reader :cursor, :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    system('clear')
    pos = self.cursor.cursor_pos

    self.board.grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        if [i,j] == pos
          print "#{piece.symbol} ".green
        else
          print add_color(piece)
        end
      end
      puts
    end
  end
  def add_color(piece)
    case piece.color
    when :black, :none
      "#{piece.symbol} ".black
    when :white
      "#{piece.symbol} ".magenta
    end
  end
end

# d = Display.new(Board.new)
# 10.times do
#   d.render
#   d.cursor.get_input
#
# end
