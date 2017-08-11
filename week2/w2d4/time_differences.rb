require 'byebug'

class Array
  #time complexity O(n**2)
  def my_min
    each do |el1|
      min = true
      each do |el2|
        if el2 < el1
          min = false
        end
      end
      return el1 if min == true
    end
  end
  #time complexity O(n)
  def my_better_min
    min = first
    each do |el|
      min = min < el ? min : el
    end
    min
  end
  #time complexity O(n**4)
  def sub_sum
    sub_arrays = []
    each_index do |ind1|
      each_index do |ind2|
        if ind1 <= ind2
          sub_arrays << self[ind1..ind2]
        end
      end
    end
    sub_arrays.map {|sub| sub.reduce(:+)}.max
  end
  #time completity 0(n)
  def better_sub_sum
    return max if all? {|x| x < 0}
    ult_sum = 0
    sum = 0
    each_with_index do |el, idx|
      if el > 0
        sum += el
        ult_sum = sum if sum > ult_sum
      else
        sum + el < 0 ? sum = 0 : sum += el
      end
    end
    ult_sum
  end
end
