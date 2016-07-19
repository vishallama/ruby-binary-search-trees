# lib/node.rb

Node = Struct.new(:key, :data, :left, :right) do

  include Comparable

  def <=> (other)
    key <=> other.key
  end

  def insert(new_node)
    raise RuntimeError unless new_node.instance_of? Node

    if new_node < self
      left.insert(new_node) unless left.nil?
      self.left = new_node
    elsif new_node > self
      right.insert(new_node) unless right.nil?
      self.right = new_node
    end
    self
  end
end

