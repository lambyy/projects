class Array
  def my_uniq
    uniq_arr = []
    self.each do |el|
      uniq_arr << el unless uniq_arr.include?(el)
    end
    uniq_arr
  end

  def two_sum
    indices = []
    self.each_index do |idx|
      (idx+1..self.length - 1).each do |idx2|
        indices << [idx, idx2] if self[idx] + self[idx2] == 0
      end
    end
    indices
  end

  def my_tranpose
    width = self.size
    transposed = Array.new(width) { Array.new(width) }
    width.times do |row|
      width.times do |col|
        transposed[col][row] = self[row][col]
      end
    end
    transposed
  end

  def stock_picker
    max_idx = self.index(self.max)
    min_idx = self.index(self.min)
    temp_arr = self.dup

    until max_idx > min_idx
      temp_arr = temp_arr.reject { |stock| stock == temp_arr[min_idx] }
      min_idx = self.index(temp_arr.min)
    end

    [min_idx, max_idx]
  end
end
