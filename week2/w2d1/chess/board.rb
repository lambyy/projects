require_relative 'pieces'
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
    [0, 1, 6, 7].each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new
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
