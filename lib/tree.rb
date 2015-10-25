require_relative 'node'

require 'pry'

# Class for a Binary Search Tree
class Tree
  attr_reader :head, :head_data_type

  def insert(data)
    node = Node.new(data)
    if head.nil?
      @head = node
      @head_data_type = data_type(head)
    else
      fail 'Cannot mix data types in tree' if data_type(node) != head_data_type
      head.push(node)
    end
  end

  def data_type(node)
    if node.data.class == Fixnum || node.data.class == Float
      :number
    elsif node.data.class == String
      :string
    else
      :unknown
    end
  end

  def count
    head ? head.count : 0
  end

  def count_leaves
    head ? head.count_leaves : 0
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
