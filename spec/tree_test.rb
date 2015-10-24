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

  def test_returns_message_if_duplicate_value_inserted_into_tree
    bst = Tree.new
    bst.insert(10)
    bst.insert(8)
    bst.insert(12)

    msg = "Ignoring node with duplicate value: 8"

    assert_equal msg, bst.insert(8)
    assert_equal 3, bst.count
  end

  def tree_keeps_adding_nodes_after_duplicate_node_encountered
    bst = Tree.new
    bst.insert(10)
    bst.insert(8)
    bst.insert(12)

    msg = "Ignoring node with duplicate value: 8"

    assert_equal msg, bst.insert(8)

    bst.insert(9)
    bst.insert(14)

    assert_equal 5, bst.count
  end

  def test_returns_true_if_left_link_exists

  end

  def test_returns_false_if_left_link_does_not_exist

  end

  def test_returns_true_if_right_link_exists

  end

  def test_returns_false_if_right_link_does_not_exist

  end

  def test_returns_true_if_only_left_link_exists

  end

  def test_returns_false_if_only_left_link_does_not_exist

  end

  def test_returns_true_if_only_right_link_exists

  end

  def test_returns_false_if_only_right_link_does_not_exist

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

  def test_returns_nil_as_min_value_if_no_head_exists
    bst = Tree.new
    assert_equal nil, bst.minimum
  end

  def test_head_as_min_value_if_only_head_exists
    bst = Tree.new
    bst.insert(10)

    assert_equal 10, bst.minimum
    assert_equal 10, bst.head.data
  end

  def test_returns_minimum_value_in_tree
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5]
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal 5, bst.minimum
  end

  def test_returns_nil_as_max_value_if_no_head_exists
    bst = Tree.new
    assert_equal nil, bst.maximum
  end

  def test_head_as_max_value_if_only_head_exists
    bst = Tree.new
    bst.insert(10)

    assert_equal 10, bst.maximum
    assert_equal 10, bst.head.data
  end

  def test_returns_maximum_value_in_tree
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5, 14]
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal 14, bst.maximum
  end

  def test_raises_exception_if_sorting_empty_tree
    bst = Tree.new

    exception = assert_raises("RuntimeError") {bst.sort}
    assert_equal("Cannot sort tree with no nodes", exception.message)
  end

  def test_returns_head_data_as_array_if_sorting_tree_with_head_only
    bst = Tree.new
    bst.insert(10)

    assert_equal [10], bst.sort
  end

  def test_returns_sorted_array_of_tree_data
    bst = Tree.new
    numbers = [10, 12, 8, 9, 6, 5, 14]
    numbers.each do |num|
      bst.insert(num)
    end

    assert_equal [5, 6, 8, 9, 10, 12, 14], bst.sort
  end
end
