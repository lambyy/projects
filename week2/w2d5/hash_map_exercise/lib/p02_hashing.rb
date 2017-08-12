class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0
    self.each_with_index do |el, idx|
      hash += el.hash * idx
    end
    hash
  end
end

class String
  def hash
    characters = self.chars.map do |char|
      char.ord
    end
    characters.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = self.to_a.sort.map do |subarray|
      subarray.map do |el|
        el.is_a?(Symbol) ? (":#{el}".hash) : (el.hash)
      end
    end
    result.flatten.hash
  end
end
