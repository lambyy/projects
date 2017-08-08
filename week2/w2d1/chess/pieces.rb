require 'byebug'
class Piece
  attr_reader :symbol, :position, :board
  def initialize(symbol = nil, position, board)
    @symbol = symbol
    @position = position
    @board = board
  end

  def to_s
  end

  def empty?
  end

  def valid_moves()
  end
end
