require_relative 'cards'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    populate
    shuffle
  end

  def deal
    @cards.pop 
  end

  def shuffle
    @cards.shuffle
  end

  private

  def populate
    [:S, :H, :D, :C].each do |suit|
      (2..14).each do |num|
        @cards << Card.new([num, suit])
      end
    end
  end

end
