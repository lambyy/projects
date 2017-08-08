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

module SlidingPiece
  # array of actual positions a Piece can move to from pos
  def moves(pos)
    moves = []
    move_dirs.each do |delta|
      x = pos[0] + delta[0]
      y = pos[1] + delta[1]
      moves << [x, y]
    end
    moves
  end

  # private
  #difference from pos
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
  #difference of horizontal moves
  def horizontal_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end
  #difference of diagonal moves
  def diagonal_dirs
    [[1, 1], [-1, -1], [1, -1], [-1, 1]]
  end


  #keep going in one direction until "stopped"
  def grow_unblocked_moves_in_dir(dx, dy)
    # debugger
    current_pos = @position
    pos = [current_pos[0] + dx, current_pos[1] + dy]
    deltas = []
    while @board[pos].nil?
      deltas << [dx, dy]
      pos = [pos[0] + dx, current_pos[1] + dy]
    end
    deltas.each_with_index do |delta, idx|
      delta.map! {|dx| dx * (idx +1) }
    end
  end
end

module SteppingPiece

end

class Rook < Piece
  include SlidingPiece

  def initialize(position, board)
    super('R', position, board)
  end

  def move_dirs()
    horizontal_dirs
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(position, board)
    super('B', position, board)
  end

  def move_dirs()
    diagonal_dirs
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(position, board)
    super('Q', position, board)
  end
end
