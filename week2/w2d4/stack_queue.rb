class StackQueue
  def initialize
    @enstack = MinMaxStack.new
    @destack = MinMaxStack.new

  end

  def enqueue(x)
    @enstack.push(x)
  end

  def dequeue
    if @destack.empty?
      @destack.push(@enstack.pop) until @enstack.empty?
    end
    @destack.pop
  end

  def max
    raise "array is empty" unless @destack.max || @enstack.max
    if @destack.max && @enstack.max
      @destack.max < @enstack.max ? @enstack.max : @destack.max
    else
      @destack.max ? @destack.max : @enstack.max
    end
  end

  def min
    raise "array is empty" unless @destack.min || @enstack.min
    if @destack.min && @enstack.min
      @destack.min > @enstack.min ? @enstack.min : @destack.min
    else
      @destack.min ? @destack.min : @enstack.min
    end
  end

  def peek
    @destack.push(@enstack.pop) until @enstack.empty?
    @destack.peek
  end

  def size
    @destack.size + @enstack.size
  end

  def empty?
    @destack.empty? && @enstack.empty?
  end
end

class MinMaxStack
  def initialize
    @store = []
    @max_array = []
    @min_array = []
  end

  def pop
    popped = @store.pop
    @max_array.pop if @max_array.last == popped
    @min_array.pop if @min_array.last == popped
    popped
  end

  def push(x)
    @max_array << x if @max_array.empty? || x >= @max_array.last
    @min_array << x if @min_array.empty? || x <= @min_array.last
    @store.push(x)
  end

  def max
    @max_array.dup.last
  end

  def min
    @min_array.dup.last
  end

  def peek
    @store.dup.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end
