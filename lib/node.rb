# lib/node.rb

Node = Struct.new(:data, :left, :right) do

  include Comparable

  def <=> (other)
    data <=> other.data
  end

  def insert(new_node)
    raise RuntimeError unless new_node.instance_of? Node

    case new_node <=> self
    when -1
      left.insert(new_node) unless left.nil?
      self.left = new_node
    when 1
      right.insert(new_node) unless right.nil?
      self.right = new_node
    end
    self
  end
end

