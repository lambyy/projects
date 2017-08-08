require 'byebug'
require 'singleton'

class Piece
  attr_reader :symbol, :position, :color, :board
  def initialize(symbol = nil, position, color, board)
    @symbol = symbol
    @position = position
    @color = color
    @board = board
  end

  def to_s
    "#{@symbol}".colorize(:color => @color)
  end

  def empty?(pos)
    @board[pos].class == NullPiece
  end

  def valid_move?(pos)
    bounds_check = @board.in_bounds?(pos)
    return :out_of_bounds unless bounds_check
    if bounds_check
      if empty?(pos)
        return :empty
      elsif @board[pos].color == self.color
        return :skip
      else
        return :take
      end
    end
  end
end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = "_"
    @color = :none
  end
end

class Pawn < Piece
    def initialize(position, color, board)
      super("P", position, color, board)
    end



end
