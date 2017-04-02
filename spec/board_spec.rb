require 'spec_helper'
module ConnectFour
    describe Board do
        context '#initialize' do
            it 'initializes a board with a grid' do
                expect { Board.new(grid: 'grid') }.to_not raise_error
            end
            it 'sets the grid with 6 rows by default ' do
                board = Board.new
                expect(board.grid).to have(6).items
            end
            it 'sets the grid with 7 columns by default' do
                board = Board.new
                board.grid.each do |row|
                    expect(row).to have(7).items
                end
            end
        end

        context '#grid' do
            it 'returns the grid' do
                board = Board.new(grid: 'grid')
                expect(board.grid).to eql 'grid'
            end
        end

        context '#get_cell' do
            it 'returns the cell based on the (x,y) coordinate' do
                grid = [
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', 'custom', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', '']
                ]
                board = Board.new(grid: grid)
                expect(board.get_cell(2, 4)).to eq 'custom'
            end
        end

        context '#set_cell' do
            it 'updates the value of the cell object at (x,y) coordinate' do
                Cat = Struct.new(:value)
                grid = [
                    [Cat.new('default'), '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', ''],
                    ['', '', '', '', '', '', '']
                ]
                board = Board.new(grid: grid)
                board.set_cell(0, 0, 'meow')
                expect(board.get_cell(0, 0).value).to eq 'meow'
            end
        end

        TestCell = Struct.new(:value)
        let(:x) { TestCell.new('x')}
        let(:o) { TestCell.new('o')}
        let(:e) { TestCell.new("")}

        context '#game_over' do
            it 'returns :winner if winner? is true' do
                board = Board.new
                allow(board).to receive(:winner?) { true }
                expect(board.game_over).to eq :winner
            end
            it 'returns :draw if winner? is false and draw? is true' do
                board = Board.new
                allow(board).to receive(:winner?) { false }
                allow(board).to receive(:draw?) { true }
                expect(board.game_over).to eq :draw
            end
            it "returns false if winner? is false and draw? is false" do
              board = Board.new
              allow(board).to receive(:winner?) { false }
              allow(board).to receive(:draw?) { false }
              expect(board.game_over).to eq false
            end
            it "returns :winner when row has 4 consecutive non unique objects" do
              grid = [
                  [e,e,e,e,e,e,e],
                  [e,e,e,e,e,e,e],
                  [e,e,e,e,e,e,e],
                  [e,e,e,e,e,e,e],
                  [e,e,e,e,e,e,e],
                  [o,o,x,x,x,x,o]
              ]
              board = Board.new(grid: grid)
              expect(board.game_over).to eq :winner
            end
            it "returns :winner when column has 4 consecutive non unique objects" do
              grid = [
                  [e,e,e,e,e,e,e],
                  [e,e,e,e,e,e,e],
                  [x,e,e,e,e,e,e],
                  [x,e,e,e,e,e,e],
                  [x,e,e,e,o,e,e],
                  [x,e,o,e,o,e,e]
              ]
              board = Board.new(grid: grid)
              expect(board.game_over).to eq :winner
            end
            it "returns :winner when a diagonal has 4 consecutive non unique objects" do
              grid = [
                  [e,e,e,x,e,e,e],
                  [e,e,x,e,e,e,e],
                  [e,x,e,e,e,e,e],
                  [x,e,e,e,e,e,e],
                  [x,e,e,e,o,e,e],
                  [x,e,o,e,o,e,e]
              ]
              board = Board.new(grid: grid)
              expect(board.game_over).to eq :winner
            end
            it "returns :draw when board is full" do
              grid = [
                  [x,o,x,o,x,o,x],
                  [o,x,o,x,o,x,o],
                  [o,x,o,x,o,x,o],
                  [x,o,x,o,x,o,x],
                  [x,o,x,o,x,o,x],
                  [x,o,x,o,x,o,x]
              ]
              board = Board.new(grid: grid)
              expect(board.game_over).to eq :draw
            end
            it "returns false when there is no winner or draw" do
              grid = [
                  [e,e,e,e,e,e,e],
                  [o,x,o,x,o,x,o],
                  [o,x,o,x,o,x,o],
                  [x,o,x,o,x,o,x],
                  [x,o,x,o,x,o,x],
                  [x,o,x,o,x,o,x]
              ]
              board = Board.new(grid: grid)
              expect(board.game_over).to eq false
            end
        end


    end
end
