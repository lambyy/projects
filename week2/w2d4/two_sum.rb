require 'byebug'

#time complexity O(n**2)
def bad_two_sum?(arr, target_sum)
  pair_array = []
  arr.each_with_index do |el1, idx1|
    arr.each_with_index do |el2, idx2|
      pair_array << [el1, el2] unless idx1 == idx2
    end
  end
  pair_array.any? { |pair| pair[0] + pair[1] == target_sum }
end

#time complexity O(nlogn)
def okay_two_sum?(arr, target_sum)
  arr.each do |el|
    return true if arr.sort.bsearch {|x| x == (target_sum - el)}
  end
  false
end

#time complexity O(n)
def two_sum?(arr, target_sum)
  comp_hash = Hash.new
  arr.each do |el|
    comp_hash[el] = target_sum - el
  end

  comp_hash.each do |k, v|
    return true if comp_hash[v] == k
  end
  false
end
