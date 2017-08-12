require_relative 'p02_hashing'
require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    linklist = @store[key.hash % num_buckets]
    return true if linklist.include?(key)
    false
  end

  def set(key, val)
    resize! if @count == num_buckets
    linklist = @store[key.hash % num_buckets]
    if linklist.include?(key)
      linklist.update(key, val)
    else
      linklist.append(key, val)
      @count += 1
    end
  end

  def get(key)
    linklist = @store[key.hash % num_buckets]
    return linklist.get(key) if linklist.include?(key)
    nil
  end

  def delete(key)
    linklist = @store[key.hash % num_buckets]
    if linklist.include?(key)
      linklist.remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |linklist|
      linklist.each do |node|
        prc.call(node.key, node.val)
      end
    end
    self
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
