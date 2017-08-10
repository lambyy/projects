class Card
  attr_reader :value

  SUIT = {
    :S => 20,
    :H => 19,
    :D => 18,
    :C => 17
  }

  # NUMBER = {
  #   "A"  => 14,
  #   "K"  => 13,
  #   "Q"  => 12,
  #   "J"  => 11,
  #   "10" => 10,
  #   "9" => 9,
  #   "8" => 8,
  #   "7" => 7,
  #   "6" => 6,
  #   "5" => 5,
  #   "4" => 4,
  #   "3" => 3,
  #   "2" => 2,
  # }

  def initialize(value)
    @value = value
  end

  def larger?(other_card)
    card_number = self.value[0]
    card_suit = SUIT[self.value[1]]

    other_card_number = other_card.value[0]
    other_card_suit = SUIT[other_card.value[1]]

    if card_number == other_card_number
      card_suit > other_card_suit
    else
      card_number > other_card_number
    end
  end
end
