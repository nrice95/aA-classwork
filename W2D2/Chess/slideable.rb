module Slideable
  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    valid_moves = []

    move_dirs.each do |dir|
      x = pos[0] + dir[0]
      y = pos[1] + dir[1]
      done = false
      while board.valid_pos?([x,y]) && !done
        if board[[x,y]].symbol == :_
          valid_moves << [x,y]
          x += dir[0]
          y += dir[1]
        elsif board[[x,y]].color != self.color
          valid_moves << [x,y]
          done = true
        else #board[[x,y]].color == self.color
          done = true
        end
      end
    end
    valid_moves
  end

  def move_dirs
    #implemented by subclass
  end


  private
  HORIZONTAL_DIRS = [
    [-1,0],
    [1,0],
    [0,-1],
    [0,1]
  ]

  DIAGONAL_DIRS = [
    [-1,-1],
    [-1,1],
    [1,-1],
    [1,1]
  ]
end
