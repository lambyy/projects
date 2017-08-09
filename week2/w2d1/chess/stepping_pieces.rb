require_relative 'pieces'

module SteppingPiece
  # def moves(pos)
  #   moves = []
  #   move_dirs.each do |delta|
  #     x = pos[0] + delta[0]
  #     y = pos[1] + delta[1]
  #     moves << [x, y]
  #   end
  #   moves
  # end
end

class King < Piece
  include SteppingPiece

  def initialize(position, color, board)
    super('K', position, color, board)
  end

  private
  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1, -1], [1, -1], [-1, 1]]
  end
end

class Knight < Piece
  include SteppingPiece

  def initialize(position, color, board)
    super('N', position, color, board)
  end

  private
  def move_dirs
    [[-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]]
  end
end
