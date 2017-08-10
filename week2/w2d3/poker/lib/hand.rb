class Hand
  attr_accessor :player_cards

  def initialize
    @player_cards = []
  end

  def add_card(card)
    @player_cards << card
  end

  def discard_card(card)
    @player_cards.delete(card)
  end

  def compare(other_card)
    hand_val = WEIGHTS[calculate_hand]
    other_hand_val = WEIGHTS[other_card.calculate_hand]
    case hand_val <=> other_hand_val
    when -1
      return other_card
    when 0
      #method to do something
    when 1
      return self
    end
  end

  private

  WEIGHTS = {
    :straight_flush => 9,
    :four_of_a_kind => 8,
    :full_house => 7,
    :flush => 6,
    :straight => 5,
    :three_of_a_kind => 4,
    :two_pair => 3,
    :one_pair => 2,
    :high_card => 1
  }

  def calculate_hand
    return :straight_flush if flush? && straight?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :three_of_a_kind if three_of_a_kind?
    return :two_pair if two_pair?
    return :one_pair if one_pair?
    :high_card
  end

  def flush?
    suit = @player_cards.first.value[1]
    @player_cards.all? {|card| card.value[1] == suit}
  end

  def straight?
    numbers = get_card_numbers
    (numbers.min..numbers.max).to_a - numbers == []
  end

  def four_of_a_kind?
    numbers = get_card_numbers
    numbers.uniq.each do |num|
      return true if numbers.count(num) == 4
    end
    false
  end

  def full_house?
    count_uniq_cards.sort == [2, 3]
  end

  def three_of_a_kind?
    count_uniq_cards.sort == [1, 1, 3]
  end

  def two_pair?
    count_uniq_cards.sort == [1, 2, 2]
  end

  def one_pair?
    count_uniq_cards.sort == [1, 1, 1, 2]
  end

  def count_uniq_cards
    numbers = get_card_numbers
    count = []
    numbers.uniq.each do |num|
      count << numbers.count(num)
    end
    count
  end

  def get_card_numbers
    numbers = []
    @player_cards.each do |card|
      numbers << card.value[0]
    end
    numbers
  end

end
