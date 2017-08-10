class TowersOfHanoi
  attr_accessor :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(start_pos, end_pos)
    raise 'This is an empty tower' if @towers[start_pos].empty?
    if @towers[end_pos].last && @towers[end_pos].last < @towers[start_pos].last
        raise 'You can\'t move a larger disk onto a smaller disk'
    end
    disc = @towers[start_pos].pop
    @towers[end_pos].push(disc)
  end
end
