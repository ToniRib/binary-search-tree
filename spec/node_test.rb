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

  def test_properly_sets_a_left_link_if_left_link_already_exists
    node1 = Node.new(10)
    node2 = Node.new(8)
    node1.push(node2)

    node3 = Node.new(6)
    node1.push(node3)

    refute_equal node3, node1.left
    assert_equal node3, node2.left
  end

  def test_properly_sets_a_right_link_if_right_link_already_exists
    node1 = Node.new(10)
    node2 = Node.new(12)
    node1.push(node2)

    node3 = Node.new(14)
    node1.push(node3)

    refute_equal node3, node1.right
    assert_equal node3, node2.right
  end

  def test_adds_right_and_left_links_in_correct_position
    node1 = Node.new(10)
    node2 = Node.new(8)
    node3 = Node.new(14)

    node1.push(node2)
    node1.push(node3)

    assert_equal node2, node1.left
    assert_equal node3, node1.right
  end

  def test_sets_all_nodes_in_correct_position_down_to_third_level
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    assert_equal node8, node10.left
    assert_equal node14, node10.right

    assert_equal node6, node8.left
    assert_equal node9, node8.right

    assert_equal node12, node14.left
    assert_equal node16, node14.right
  end

  def test_returns_true_if_node_is_equal_to_search_value
    node = Node.new(10)

    assert node.equal_to?(10)
  end

  def test_returns_true_if_left_link_is_equal_to_search_value
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert node1.equal_to?(8)
  end

  def test_returns_true_if_right_link_is_equal_to_search_value
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert node1.equal_to?(12)
  end

  def test_returns_true_if_value_is_found_in_left_side_of_tree
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    assert node10.equal_to?(9)
  end

  def test_returns_true_if_value_is_found_in_right_side_of_tree
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    assert node10.equal_to?(12)
  end

  def test_returns_false_if_value_is_not_found_in_left_side_of_tree
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    refute node10.equal_to?(3)
  end

  def test_returns_false_if_value_is_not_found_in_right_side_of_tree
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    refute node10.equal_to?(18)
  end

  def test_node_with_no_links_returns_itself_as_minimum
    node = Node.new(10)

    assert_equal 10, node.minimum
  end

  def test_node_with_only_right_link_returns_itself_as_minimum
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal 10, node1.minimum
  end

  def test_node_with_only_left_link_returns_left_link_as_minimum
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal 8, node1.minimum
  end

  def test_node_with_both_links_returns_left_link_as_minimum
    node1 = Node.new(10)
    node2 = Node.new(8)
    node3 = Node.new(12)

    node1.push(node2)
    node1.push(node3)

    assert_equal 8, node1.minimum
  end

  def test_returns_leftmost_node_as_minimum
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    assert_equal 6, node10.minimum
  end

  def test_returns_leftmost_node_of_all_levels_as_minimum
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node12)
    node10.push(node16)

    assert_equal 8, node10.minimum
  end

  def test_node_with_no_links_returns_itself_as_maximum
    node = Node.new(10)

    assert_equal 10, node.maximum
  end

  def test_node_with_only_left_link_returns_itself_as_maximum
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal 10, node1.maximum
  end

  def test_node_with_only_right_link_returns_right_link_as_maximum
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal 12, node1.maximum
  end

  def test_node_with_both_links_returns_right_link_as_maximum
    node1 = Node.new(10)
    node2 = Node.new(8)
    node3 = Node.new(12)

    node1.push(node2)
    node1.push(node3)

    assert_equal 12, node1.maximum
  end

  def test_returns_rightmost_node_as_maximum
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)

    assert_equal 16, node10.maximum
  end

  def test_returns_rightmost_node_of_all_levels_as_maximum
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)

    assert_equal 14, node10.maximum
  end

  def test_single_node_returns_depth_of_one
    node = Node.new(10)

    assert_equal 1, node.depth(10)
  end

  def test_returns_2_if_node_is_left_child
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal 2, node1.depth(8)
  end

  def test_returns_2_if_node_is_right_child
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal 2, node1.depth(12)
  end
end
