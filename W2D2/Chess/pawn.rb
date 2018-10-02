require_relative "piece"

class Pawn < Piece
  def initialize(color, board, pos)
    super
    @initial_pos = pos.dup
    @forward_dir = [1,0]
    if pos[0] == 6 #if pawn is on the near side
      @forward_dir = [-1,0]
    end
  end

  def symbol
    :P
  end

  def moves
    forward_steps + side_attacks
  end



  private

  def at_start_row?
    @pos == @initial_pos
  end

  def forward_dir
    @forward_dir
  end

  def forward_steps
    steps = []
    next_pos = [@pos[0] + @forward_dir[0],@pos[1]]
    if @board.valid_pos?(next_pos) && @board[next_pos].symbol == :_
      steps << next_pos
      new_next_pos = [next_pos[0] + @forward_dir[0],next_pos[1]]
      if at_start_row? && @board.valid_pos?(new_next_pos) && @board[new_next_pos].symbol == :_
        steps << new_next_pos
      end
    end
    steps
  end

  def side_attacks
    attacks = [
      [@pos[0] + @forward_dir[0],@pos[1] + 1],
      [@pos[0] + @forward_dir[0],@pos[1] - 1]
    ]
    attacks.select do |pos|
      if @board.valid_pos?(pos)
        @board[pos].color == Board.opposite_color(color)
      end
    end
  end
end
