# Class for nodes of a Binary Search Tree

require 'pry'
class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def left_link_exists
    !left.nil?
  end

  def right_link_exists
    !right.nil?
  end

  def only_left_link_exists
    left_link_exists && right.nil?
  end

  def only_right_link_exists
    right_link_exists && left.nil?
  end

  def no_links_exist
    left.nil? && right.nil?
  end

  def push(node)
    if node.data < data
      add_node_to_left_link(node)
    elsif node.data > data
      add_node_to_right_link(node)
    else
      return_duplicate_node_message(node)
    end
  end

  def add_node_to_left_link(node)
    if left.nil?
      @left = node
    else
      left.push(node)
    end
  end

  def add_node_to_right_link(node)
    if right.nil?
      @right = node
    else
      right.push(node)
    end
  end

  def return_duplicate_node_message(node)
    "Ignoring node with duplicate value: #{node.data}"
  end

  def include?(value)
    return true if data == value

    if value < data && left_link_exists
      left.include?(value)
    elsif value > data && right_link_exists
      right.include?(value)
    else
      false
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
    fail 'Value does not exist in tree' unless include?(value)

    return 1 if data == value

    if value < data
      1 + left.depth(value)
    else
      1 + right.depth(value)
    end
  end

  def count
    return 1 if no_links_exist

    if only_left_link_exists
      1 + left.count
    elsif only_right_link_exists
      1 + right.count
    else
      1 + left.count + right.count
    end
  end

  def count_leaves
    return 1 if no_links_exist

    if only_left_link_exists
      left.count_leaves
    elsif only_right_link_exists
      right.count_leaves
    else
      left.count_leaves + right.count_leaves
    end
  end

  def sort
    return [data] if no_links_exist

    sorted = []

    if only_left_link_exists
      sorted.push(left.sort).push(data)
    elsif only_right_link_exists
      sorted.push(data).push(right.sort)
    else
      sorted.push(left.sort).push(data).push(right.sort)
    end

    sorted.flatten
  end

  def max_height
    return 1 if no_links_exist

    left_height = 0
    right_height = 0

    left_height = 1 + left.max_height if left_link_exists
    right_height = 1 + right.max_height if right_link_exists

    return_longest_height(left_height, right_height)
  end

  def return_longest_height(left, right)
    left < right ? right : left
  end

  def delete(value)
    if value < data
      search_branch(left, value)
    elsif value > data
      search_branch(right, value)
    end
  end

  def search_branch(branch, value)
    if branch.data == value
      branch.no_links_exist ? set_to_nil(branch) : replace_node(branch)
    else
      branch.delete(value)
    end
  end

  def set_to_nil(branch)
    branch == left ? @left = nil : @right = nil
  end

  def replace_node(next_node)
    if next_node.only_left_link_exists
      @left = next_node.left
    elsif next_node.only_right_link_exists
      @right = next_node.right
    else
      inorder_successor = find_inorder_successor(next_node)
      next_node.delete(inorder_successor)
      next_node.data = inorder_successor
    end
  end

  def find_inorder_successor(next_node)
    next_node.right.minimum
  end
end
