module ConnectFour
    class Game
        attr_reader :players, :board, :current_player, :other_player
        def initialize(players, board = Board.new)
            @players = players
            @board = board
            @current_player, @other_player = players.shuffle
        end

        def switch_players
            @current_player, @other_player = @other_player, @current_player
        end

        def solicit_move
            "#{current_player.name}: Enter a column number between 1 and 7 to make your move"
        end

        def get_move(human_move = gets.chomp)
            if !human_move.to_i.between?(1,7)
              until human_move.to_i.between?(1,7)
                puts "Invalid Column Number. Please Try Again: "
                human_move = gets.chomp
              end
            human_move_to_coordinate(human_move)
            else
            human_move_to_coordinate(human_move)
            end
        end

        def game_over_message
          return "#{current_player.name} won!" if board.game_over == :winner
          return "The game ended in a tie" if board.game_over == :draw
        end

        def play
          puts "#{current_player.name} has been randomly been selected to go first!"
          while true
            board.formatted_grid
            puts ""
            puts solicit_move
            move = get_move
            x = move[0]
            y = move[1]
            board.set_cell(x,y,current_player.piece)
            if board.game_over
              puts game_over_message
              board.formatted_grid
              return
            else
              switch_players
            end
          end
        end

        private

        def human_move_to_coordinate(human_move) # returns coordinates of first non empty cell in a column
            mapping = {
                '1' => [ @board.grid.transpose[0].rindex { |cell| cell.value.empty? } , 0 ],
                '2' => [ @board.grid.transpose[1].rindex { |cell| cell.value.empty? } , 1 ],
                '3' => [ @board.grid.transpose[2].rindex { |cell| cell.value.empty? } , 2 ],
                '4' => [ @board.grid.transpose[3].rindex { |cell| cell.value.empty? } , 3 ],
                '5' => [ @board.grid.transpose[4].rindex { |cell| cell.value.empty? } , 4 ],
                '6' => [ @board.grid.transpose[5].rindex { |cell| cell.value.empty? } , 5 ],
                '7' => [ @board.grid.transpose[6].rindex { |cell| cell.value.empty? } , 6 ]
            }
            mapping[human_move]
        end
    end
end
