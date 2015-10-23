require 'minitest/autorun'
require 'minitest/pride'
require './lib/tree'

class TreeTest < Minitest::Test
  def test_can_add_a_head_node
    bst = Tree.new
    bst.insert(10)

    assert_equal 10, bst.head.data
  end

  def test_adds_smaller_node_to_left_without_overwriting_head_node
    bst = Tree.new
    bst.insert(10)
    bst.insert(8)

    assert_equal 10, bst.head.data
    assert_equal 8, bst.head.left.data
    refute bst.head.right
  end

  def test_adds_larger_node_to_right_without_overwriting_head_node
    bst = Tree.new
    bst.insert(10)
    bst.insert(12)

    assert_equal 10, bst.head.data
    assert_equal 12, bst.head.right.data
    refute bst.head.left
  end
end
