require 'spec_helper'
module ConnectFour
    describe Game do
        let (:nick) { Player.new(piece: 'X', name: 'Nick') }
        let (:john) { Player.new(piece: 'O', name: 'John') }
        T_Cell = Struct.new(:value)
        X = T_Cell.new("X")
        O = T_Cell.new("O")
        E = T_Cell.new("")
        let (:grid) {[
            [E,E,E,E,E,E,E],
            [E,E,E,E,E,E,E],
            [E,E,E,E,E,E,E],
            [E,E,E,E,E,E,E],
            [E,E,E,E,E,E,E],
            [X,E,E,E,E,E,O],
        ]}
        #let (:board) {Board.new(grid: grid)}

        let (:board) { Board.new}
        context '#initialize' do
            it 'randomly selects a current_player' do
                allow_any_instance_of(Array).to receive(:shuffle).and_return([nick, john])
                game = Game.new([john, nick])
                expect(game.current_player).to eq nick
            end
            it 'randomly selects an other_player' do
                allow_any_instance_of(Array).to receive(:shuffle).and_return([nick, john])
                game = Game.new([john, nick])
                expect(game.other_player).to eq john
            end
        end

        context '#switch_players' do
            it 'will set @current_player to @other_player' do
                game = Game.new([john, nick])
                other_player = game.other_player
                game.switch_players
                expect(game.current_player).to eq other_player
            end
            it 'will set @other_player to @current_player' do
                game = Game.new([john, nick])
                current_player = game.current_player
                game.switch_players
                expect(game.other_player).to eq current_player
            end
        end

        context '#solicit_move' do
            it 'asks the player to make a move' do
                game = Game.new([john, nick])
                allow(game).to receive(:current_player) { john }
                expected = 'John: Enter a column number between 1 and 7 to make your move'
                expect(game.solicit_move).to eq expected
            end
        end


        context '#get_move' do
            it "converts human_move of '1' to [0,5]" do
                game = Game.new([john, nick])
                expect(game.get_move("1")).to eq [0, 5]
            end
            it "converts human_move of 7 to [6,5]" do
              game = Game.new([john, nick])
              expect(game.get_move("7")).to eq [6, 5]
            end
            it "converts human_move of '1' to [0,4] when 1 piece exists in that column" do
              game = Game.new([john, nick],Board.new(grid: grid))
              expect(game.get_move("1")).to eq [0,4]
            end
            it "converts human_move of '7' to [6,4] when 1 piece exists in that column" do
              game = Game.new([john, nick],Board.new(grid: grid))
              expect(game.get_move("7")).to eq [6,4]
            end
        end

        context "#game_over_message" do
          it "returns '#current_player name' won! if board shows a winner" do
            game = Game.new([john,nick])
            allow(game).to receive(:current_player) { nick }
            allow(game.board).to receive(:game_over) {:winner}
            expect(game.game_over_message).to eq "Nick won!"
          end
          it "returns The game ended in a tie" do
            game = Game.new([john,nick])
            allow(game).to receive(:current_player) { nick }
            allow(game.board).to receive(:game_over) {:draw}
            expect(game.game_over_message).to eq "The game ended in a tie"
          end
        end


    end
end
