require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree'

class TreeTest < Minitest::Test
  def test_can_add_a_head_node
    bst = Tree.new
    bst.insert(10)

    assert_equal 10, bst.head.data
  end

  def test_inserts_smaller_node_to_left_without_overwriting_head_node
    bst = Tree.new
    bst.insert(10)
    bst.insert(8)

    assert_equal 10, bst.head.data
    assert_equal 8, bst.head.left.data
    refute bst.head.right
  end

  def test_inserts_larger_node_to_right_without_overwriting_head_node
    bst = Tree.new
    bst.insert(10)
    bst.insert(12)

    assert_equal 10, bst.head.data
    assert_equal 12, bst.head.right.data
    refute bst.head.left
  end

  def test_inserts_left_and_right_nodes
    bst = Tree.new
    bst.insert(10)
    bst.insert(8)
    bst.insert(12)

    assert_equal 10, bst.head.data
    assert_equal 8, bst.head.left.data
    assert_equal 12, bst.head.right.data
  end

  def test_returns_count_zero_if_there_is_no_head_node
    bst = Tree.new
    assert_equal 0, bst.count
  end

  def test_returns_count_one_if_tree_contains_only_head_node
    bst = Tree.new
    bst.insert(10)

    assert_equal 1, bst.count
  end

  def test_returns_count_of_nodes_in_tree
    bst = Tree.new
    numbers = (0..1000).to_a.sample(16)
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal 16, bst.count
  end

  def test_returns_max_height_of_zero_if_no_head_node
    bst = Tree.new
    assert_equal 0, bst.max_height
  end

  def test_returns_max_height_of_one_if_tree_contains_only_head_node
    bst = Tree.new
    bst.insert(10)

    assert_equal 1, bst.max_height
  end

  def test_returns_max_height_of_tree
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal 4, bst.max_height
  end

  def test_returns_false_for_include_if_tree_is_empty
    bst = Tree.new

    refute bst.include?(3)
  end

  def test_returns_true_if_tree_contains_value
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    assert bst.include?(6)
  end

  def test_returns_false_if_tree_does_not_contain_value
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    refute bst.include?(3)
  end

  def test_raises_exception_if_no_head_exists
    bst = Tree.new

    exception = assert_raises("RuntimeError") {bst.depth_of(9)}
    assert_equal("Value does not exist in tree, because tree has no head", exception.message)
  end

  def test_raises_exception_if_value_if_not_found
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    exception = assert_raises("RuntimeError") {bst.depth_of(3)}
    assert_equal("Value does not exist in tree", exception.message)
  end

  def test_returns_one_if_value_matches_head
    bst = Tree.new
    bst.insert(10)

    assert_equal 1, bst.depth_of(10)
  end

  def test_returns_depth_of_value
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal 2, bst.depth_of(8)
    assert_equal 3, bst.depth_of(9)
  end

end
