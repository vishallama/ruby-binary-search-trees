# lib/node.rb

Node = Struct.new(:key, :data, :left, :right) do
  include Comparable
  include Enumerable

  def <=> (other)
    key <=> other.key
  end

  def insert(new_node)
    raise ArgumentError unless new_node.instance_of? Node

    if new_node < self
      if left.nil?
        self.left = new_node
      else
        left.insert(new_node)
      end
    elsif new_node > self
      if right.nil?
        self.right = new_node
      else
        right.insert(new_node)
      end
    end
    self
  end

  def each(&block)
    left.each(&block) if left
    block.call(self)
    right.each(&block) if right
  end

  def leaf?
    left.nil? && right.nil?
  end

end

