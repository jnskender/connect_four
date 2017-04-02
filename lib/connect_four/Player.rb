module ConnectFour
  class Player
    attr_accessor :piece, :name
    def initialize(input)
      @piece = input.fetch(:piece)
      @name = input.fetch(:name)
    end
  end
end
