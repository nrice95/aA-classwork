class Game
  def initialize(players = {human: HumanPlayer.new, computer: ComputerPlayer.new})
    @board = Board.new
    @display = Display.new
    @players = players
    @current_player = nil
  end

  def play
  end







  private

  def notify_players
  end

  def swap_turn!
  end
end
