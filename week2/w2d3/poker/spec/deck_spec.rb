require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) {Deck.new}
  describe '#initialize' do
    it 'creates a deck of 52 cards' do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe '#shuffle' do
    it 'shuffles the deck' do
      expect(deck.cards).to_not eq(deck.cards.sort_by {|card| card.value})
    end
  end

  describe '#deal' do
    it 'reduces the number of cards in the deck' do
      deck.deal
      expect(deck.cards.length).to eq(51)
    end
  end

end
