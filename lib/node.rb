require 'pry'

class Node
  attr_accessor :left, :right
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # will need to refactor
  def push(node)
    if node.data < data
      if left.nil?
        @left = node
      else
        left.push(node)
      end
    else
      if right.nil?
        @right = node
      else
        right.push(node)
      end
    end
  end

  def equal_to?(value)
    return true if data == value

    if value < data && !left.nil?
      left.equal_to?(value)
    elsif value > data && !right.nil?
      right.equal_to?(value)
    end
  end

  def minimum
    return data if left.nil?
    left.minimum
  end

  def maximum
    return data if right.nil?
    right.maximum
  end

  def depth(value)
    raise "Value does not exist in tree" if !equal_to?(value)

    return 1 if data == value

    if value < data
      1 + left.depth(value)
    else
      1 + right.depth(value)
    end
  end

  def count
    return 1 if left.nil? && right.nil?

    if !left.nil? && right.nil?
      1 + left.count
    elsif !right.nil? && left.nil?
      1 + right.count
    else
      1 + left.count + right.count
    end
  end

  def sort
    return [data] if left.nil? && right.nil?

    sorted = []
    if !left.nil? && right.nil?
      sorted.push(left.sort).push(data)
    elsif !right.nil? && left.nil?
      sorted.push(data).push(right.sort)
    else
      sorted.push(left.sort).push(data).push(right.sort)
    end
    sorted.flatten
  end
end
