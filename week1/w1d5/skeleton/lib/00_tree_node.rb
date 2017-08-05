class PolyTreeNode

  def initialize(value)
      @value = value
      @parent = nil
      @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    if @parent
      @parent.children.delete(self)
    end
    @parent = node
    @parent.children << self if @parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Error: not a child' unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?
    self.children.each do |child_node|
      search_outcome = child_node.dfs(target_value)
      return search_outcome if search_outcome
    end
    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      return queue[0] if queue[0].value == target_value
      queue[0].children.each do |child|
        queue << child
      end
      queue.shift
    end
    nil
  end
end
