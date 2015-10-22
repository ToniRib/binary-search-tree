require 'minitest/autorun'
require 'minitest/pride'
require './lib/node'

class NodeTest < Minitest::Test
  def test_can_create_a_node_with_data
    node = Node.new(10)
    assert_equal 10, node.data
  end

  def test_has_a_left_link_whose_default_is_nil
    node = Node.new(10)
    refute node.left
  end

  def test_has_a_right_link_whose_default_is_nil
    node = Node.new(10)
    refute node.right
  end

  def test_can_directly_set_left_link_as_another_node
    node1 = Node.new(10)
    node2 = Node.new(8)
    node1.left = node2
    assert_equal node2, node1.left
  end

  def test_can_directly_set_right_link_as_another_node
    node1 = Node.new(10)
    node2 = Node.new(12)
    node1.right = node2
    assert_equal node2, node1.right
  end

  def test_can_use_push_method_to_set_empty_left_link
    node1 = Node.new(10)
    node2 = Node.new(8)
    node1.push(node2)
    assert_equal node2, node1.left
    refute node1.right
  end

  def test_can_use_push_method_to_set_empty_right_link
    node1 = Node.new(10)
    node2 = Node.new(12)
    node1.push(node2)
    assert_equal node2, node1.right
    refute node1.left
  end

  def test_can_set_a_left_link_if_left_link_already_exists
    node1 = Node.new(10)
    node2 = Node.new(8)
    node1.push(node2)

    node3 = Node.new(6)
    node1.push(node3)

    refute_equal node3, node1.left
    assert_equal node3, node2.left
  end

  def test_can_set_a_right_link_if_right_link_already_exists
    node1 = Node.new(10)
    node2 = Node.new(12)
    node1.push(node2)

    node3 = Node.new(614)
    node1.push(node3)

    refute_equal node3, node1.right
    assert_equal node3, node2.right
  end
end
