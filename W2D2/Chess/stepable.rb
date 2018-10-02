module Stepable

  def king_dirs
    King_moves
  end

  def knight_dirs
    Knight_moves
  end
  
  def moves
    valid_moves = []
    move_dirs.each do |dir|
      x = pos[0] + dir[0]
      y = pos[1] + dir[1]
      if board.valid_pos?([x,y])
        if board[[x,y]].symbol == :_
          valid_moves << [x,y]

        elsif board[[x,y]].color != self.color
          valid_moves << [x,y]

        end #board[[x,y]].color == self.color
      end
    end
      valid_moves
  end

private

Knight_moves = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ].freeze

  King_moves = [
    [1,1],
    [1,0],
    [1, -1],
    [0, 1],
    [-1, 0],
    [0, -1],
    [-1, 1],
    [-1, -1]
  ].freeze

end
