require_relative 'stack_queue'

def windowed_max_range(arr, size)
  current_max_range = 0
  arr.each_with_index do |el, idx|
    break if idx + size > arr.length
    window = arr[idx...idx+size]
    range = window.max - window.min
    current_max_range = range if current_max_range < range
  end
  current_max_range
end

def queue_max(arr, size)
  sq = StackQueue.new

  size.times do |i|
    sq.enqueue(arr[i])
  end

  max_range = sq.max - sq.min

  (arr.length - size).times do |i|
    sq.enqueue(arr[size + i])
    sq.dequeue
    max_range = sq.max - sq.min if sq.max - sq.min > max_range
  end

  max_range

end

if __FILE__ == $0
  p queue_max([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
  p queue_max([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
  p queue_max([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
  p queue_max([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
end
