require_relative 'pieces'
require_relative 'sliding_pieces'
require_relative 'stepping_pieces'

class StartPosError < StandardError
  def message
    "There is no piece here to move!"
  end
end

class EndPosError < StandardError
  def message
    "You can not place piece here!"
  end
end

class Board
  CHAR_MAP = {
    K: King,
    Q: Queen,
    R: Rook,
    N: Knight,
    B: Bishop,
    P: Pawn
  }

  attr_reader :grid

  def initialize
    @grid = Array.new(8) {Array.new(8)}
    set_board
  end

  def move_piece(start_pos, end_pos)
    raise StartPosError if self[start_pos].nil?
    raise EndPosError unless self[end_pos].nil?
    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def in_bounds?(pos)
    row, col = pos
    row.between?(0,7) && col.between?(0,7)
  end

  def set_board
    row_setter = [:R, :N, :B, :Q, :K, :B, :N, :R]
    nullpiece = NullPiece.instance
    (0..7).each do |row|
      (0..7).each do |col|
        if row == 0 || row == 7
          color = :blue if row == 7
          color = :red if row == 0
          piece = CHAR_MAP[row_setter[col]].new([row, col], color, self)
          @grid[row][col] = piece
        elsif row == 1 || row == 6
          color = :blue if row == 6
          color = :red if row == 1
          @grid[row][col] = Pawn.new([row, col], color, self)
        else
          @grid[row][col] = nullpiece
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end
