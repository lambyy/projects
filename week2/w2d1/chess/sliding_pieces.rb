require_relative 'pieces'

module SlidingPiece
  # array of actual positions a Piece can move to from pos
  # def moves(pos)
  #   moves = []
  #   move_dirs.each do |delta|
  #     x = pos[0] + delta[0]
  #     y = pos[1] + delta[1]
  #     moves << [x, y]
  #   end
  #   moves
  # end

  private
  #difference from pos
  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
  #difference of horizontal moves
  def horizontal_dirs
    dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]]
    growing_dirs(dirs)
  end
  #difference of diagonal moves
  def diagonal_dirs
    dirs = [[1, 1], [-1, -1], [1, -1], [-1, 1]]
    growing_dirs(dirs)
  end

  def growing_dirs(dirs)
    all_dirs = []
    dirs.each do |(dx,dy)|
      all_dirs.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    all_dirs
  end

  #keep going in one direction until "stopped"
  def grow_unblocked_moves_in_dir(dx, dy)
    current_pos = @position
    pos = [current_pos[0] + dx, current_pos[1] + dy]
    deltas = []
    while @board.in_bounds?(pos)
      result = valid_move?(pos)
      case result
      when :empty
        deltas << [dx, dy]
        pos = [pos[0] + dx, pos[1] + dy]
      when :take
        deltas << [dx, dy]
        break
      when :skip
        pos = [pos[0] + dx, pos[1] + dy]
      end
    end
    deltas.each_with_index do |delta, idx|
      delta.map! { |d| d * (idx + 1) }
    end
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(position, color, board)
    super('R', position, color, board)
  end

  private
  def move_dirs()
    horizontal_dirs
  end
end

class Bishop < Piece
  include SlidingPiece

  def initialize(position, color, board)
    super('B', position, color, board)
  end

  private
  def move_dirs()
    diagonal_dirs
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(position, color, board)
    super('Q', position, color, board)
  end
end
