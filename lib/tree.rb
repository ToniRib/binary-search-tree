require 'pry'
require_relative 'node'

class Tree
  attr_reader :head

  def insert(data)
    node = Node.new(data)
    if head.nil?
      @head = node
    else
      head.push(node)
    end
  end

  def count
    head ? head.count : 0
  end

  def max_height
    head ? head.max_height : 0
  end
end

if __FILE__ == $0
  numbers = (0..1000).to_a.sample(16)
  bst = Tree.new
  numbers.each do |num|
    bst.insert(num)
  end

  puts bst.inspect
  puts bst.count
  puts bst.max_height
end
