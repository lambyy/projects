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

  def moves(pos)
    moves = []
    move_dirs.each do |delta|
      moves << new_pos(pos, delta)
    end
    moves
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

  def new_pos(pos, delta)
    [pos[0] + delta[0], pos[1] + delta[1]]
  end

  def move_dirs
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

  private
  def move_dirs
    if self.color == :red
      pawn_dirs([1,0], [1,-1], [1,1])
    else
    end
  end

  def pawn_dirs(arr1, arr2, arr3)
    all_dirs = []
    all_dirs << arr1 if valid_move?(new_pos(@position, arr1)) == :empty
    all_dirs << arr2 if valid_move?(new_pos(@position, arr2)) == :take
    all_dirs << arr3 if valid_move?(new_pos(@position, arr3)) == :take
    all_dirs
  end
end
