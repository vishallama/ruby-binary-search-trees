# lib/bst.rb
require 'node'

class BST
  include Enumerable

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(*new_nodes)
    if empty?
      @root = new_nodes.first
      new_nodes[1..-1].each { |node| root.insert(node) }
    else
      new_nodes.each { |node| root.insert(node) }
    end
    self
  end

  def each(&block)
    root.each(&block)
  end
  
  def empty?
    root.nil?
  end

end

