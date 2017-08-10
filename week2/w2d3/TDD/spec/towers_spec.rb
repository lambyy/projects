require 'rspec'
require 'towers'

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
      it 'sets a starting array of three disks' do
        expect(game.towers).to eq([[3, 2, 1], [], []])
      end
  end

  describe '#move' do
    it 'raises an error if an empty tower is selected' do
      expect { game.move(1, 0) }.to raise_error('This is an empty tower')
    end

    it 'removes a disk from the start tower' do
      game.move(0,1)
      expect(game.towers[0]).to eq([3,2])
    end
    it 'places a disk on the end tower' do
      game.move(0,1)
      expect(game.towers[1]).to eq([1])
    end
    it 'raises an error if a larger disk is placed on a smaller disk' do
      game.towers = [[3],[2],[1]]
      expect { game.move(0,1) }.to raise_error('You can\'t move a larger disk onto a smaller disk')
    end
  end
end
