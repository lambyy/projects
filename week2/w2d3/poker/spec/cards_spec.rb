require 'rspec'
require 'cards'

describe 'Cards' do
  subject(:card) {Card.new([14,:S])}

  describe '#initialize' do
    it 'stores a card value' do
      expect(card.value).to eq([14,:S])
    end
  end

  describe '#larger?' do
    let(:smallercard) {Card.new([8,:D])}
    it 'returns true if the receiver is larger' do
      expect(card.larger?(smallercard)).to be true
    end
  end

end
