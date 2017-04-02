module ConnectFour
  class Game
    attr :players,:board, :current_player,:other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end
  end
end
