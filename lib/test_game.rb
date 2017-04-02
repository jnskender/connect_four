require "./connect_four.rb"


puts "Welcome to Connect Four!"
player1 = ConnectFour::Player.new({piece: "X", name: "Nick"})
player2 = ConnectFour::Player.new({piece: "O", name: "John"})
players = [player1,player2]
ConnectFour::Game.new(players).play
