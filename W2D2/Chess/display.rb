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
          print "#{piece.symbol} ".red
        else
          print "#{piece.symbol} "
        end
      end
      puts
    end
  end

end

d = Display.new(Board.new)
10.times do
  d.render
  d.cursor.get_input

end
