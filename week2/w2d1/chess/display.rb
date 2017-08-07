require 'colorize'
require_relative 'board'
require_relative 'cursor'
class Display
  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], @board)
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    cursor = @cursor.cursor_pos
    @board.grid.each_index do |row|
      result = []
      @board.grid[row].each_index do |col|
        if [row, col] == cursor
          result << "X".colorize(:color => :white, :background => :red)
        else
          result << "X"
        end
      end
      puts "#{row} #{result.join(" ")}"
    end
  end

  def move_cursor
    input = nil
    until input != nil
      input = @cursor.get_input
      render
    end
  end
end
