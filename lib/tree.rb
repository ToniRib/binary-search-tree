require_relative 'node'

# Class for a Binary Search Tree
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

  def include?(value)
    head ? head.include?(value) : false
  end

  def depth_of(value)
    if head.nil?
      fail 'Value does not exist in tree, because tree has no head'
    else
      head.depth(value)
    end
  end

  def minimum
    head ? head.minimum : nil
  end

  def maximum
    head ? head.maximum : nil
  end

  def sort
    if head.nil?
      fail 'Cannot sort tree with no nodes'
    else
      head.sort
    end
  end

  def delete(value)
    fail 'Cannot delete non-existent tree node' unless include?(value)

    if head_only
      @head = nil
    else
      head.delete(value)
    end
  end

  def head_only
    count == 1
  end
end
