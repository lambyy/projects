require 'rspec'
require 'hand'

describe 'Hand' do
  subject(:hand) {Hand.new}

  let(:card_3S) {double(:value => [3, :S])}
  let(:card_3H) {double(:value => [3, :H])}
  let(:card_3D) {double(:value => [8, :D])}

  let(:card_4S) {double(:value => [11, :S])}
  let(:card_4H) {double(:value => [10, :H])}
  let(:card_4D) {double(:value => [9, :D])}

  let(:card_5S) {double(:value => [8, :S])}
  let(:card_5H) {double(:value => [5, :H])}

  let(:card_6S) {double(:value => [8, :S])}
  let(:card_6H) {double(:value => [7, :H])}

  describe '#initialize' do
    it 'starts with an empty hand' do
      expect(hand.player_cards).to eq([])
    end
  end

  describe '#add_card' do
    it 'adds a card to the hand' do
      hand.add_card(card_3S)
      expect(hand.player_cards).to eq([card_3S])
    end
  end

  describe '#discard_card' do
    it 'discards a card from the hand' do
      hand.add_card(card_3S)
      hand.add_card(card_3D)
      hand.discard_card(card_3S)
      expect(hand.player_cards).to eq([card_3D])
    end
  end

  describe '#compare' do
    let(:other_hand) {Hand.new}
    context 'when hands are different ranks' do
      it 'returns the better hand' do
        hand.player_cards
        hand.add_card(card_3S)
        hand.add_card(card_3H)
        hand.add_card(card_3D)
        hand.add_card(card_5S)
        hand.add_card(card_5H)
        other_hand.add_card(card_4S)
        other_hand.add_card(card_4H)
        other_hand.add_card(card_4D)
        other_hand.add_card(card_6S)
        other_hand.add_card(card_6H)

        expect(hand.compare(other_hand)).to eq(other_hand)
      end
    end

  end



end
