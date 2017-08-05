require 'byebug'
class KnightPathFinder
  attr_accessor :found_paths
  def initialize(pos)
    @found_paths = Array.new(8) do |r|
      Array.new(8) do |c|
        pos == [r, c] ? pos : nil
      end
    end
    @offsets = offsets
    @root = pos
    build_move_tree
  end

  def build_move_tree
    queue = [[@root]]
    until queue.empty?
      path = queue.shift
      moves = new_move_positions(path.last)
      paths = moves.map do |move|
        path_candidate = path.dup << move
        unless @found_paths[move[0]][move[1]]
          @found_paths[move[0]][move[1]] = path_candidate
        end
      end
      paths.each do |correct_path|
        queue << correct_path
      end
    end

  end

  def find_path(pos)
    @found_paths[pos[0]][pos[1]]
  end

  def new_move_positions(pos)
    moves = @offsets.map do |offset|
      [pos[0] + offset[0], pos[1] + offset[1]]
    end
    moves.select do |move|
      KnightPathFinder.valid_move?(move) && !@found_paths[move[0]][move[1]]
    end
  end

  def self.valid_move?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
  end

  def offsets
    prod = [-2, -1, 0, 1, 2].product([-2, -1, -0, 1, 2])
    prod.select do |coord|
      abs_coord = coord.map(&:abs)
      abs_coord.include?(1) && abs_coord.include?(2)
    end
  end
end
