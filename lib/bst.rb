# lib/bst.rb
require 'node'

class BST
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(new_node)
    raise ArgumentError unless new_node.instance_of? Node

    if empty?
      @root = new_node
    else
      root.insert(new_node)
    end
    self
  end

  private

  def empty?
    root.nil?
  end

end

