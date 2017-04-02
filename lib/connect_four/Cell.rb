module ConnectFour
  class Cell
      attr_accessor :value, :blank_cell, :x_piece, :o_piece

      @@blank_cell = ""
      @@x_piece = "X"
      @@o_piece = "O"

      def initialize(value = @@blank_cell)
          @value = value
      end

  end
end
