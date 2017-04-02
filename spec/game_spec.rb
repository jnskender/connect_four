require 'spec_helper'
module ConnectFour
    describe Game do
        let (:nick) { Player.new(piece: 'X', name: 'Nick') }
        let (:john) { Player.new(piece: 'O', name: 'John') }

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
        context "#switch_players" do
          it "will set @current_player to @other_player" do
            game = Game.new([john,nick])
            other_player = game.other_player
            game.switch_players
            expect(game.current_player).to eq other_player
          end
          it "will set @other_player to @current_player" do
            game = Game.new([john,nick])
            current_player = game.current_player
            game.switch_players
            expect(game.other_player).to eq current_player
          end
        end
    end
end
