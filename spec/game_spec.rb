require "spec_helper"
module ConnectFour

  describe Game do

    let (:nick) {Player.new({piece: "X", name: "Nick"})}
    let (:john) {Player.new({piece: "O", name: "John"})}

    context "#initialize" do
      it "randomly selects a current_player" do
        allow_any_instance_of(Array).to receive(:shuffle).and_return([nick,john])
        game = Game.new([john,nick])
        expect(game.current_player).to eq nick
    end
  end
end
end
