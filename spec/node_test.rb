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

  def test_returns_message_to_user_if_node_already_exists
    node10 = Node.new(10)
    node8a = Node.new(8)
    node14 = Node.new(14)
    node8b = Node.new(8)

    node10.push(node8a)
    node10.push(node14)

    msg = "Ignoring node with duplicate value: #{node8b.data}"

    assert_equal msg, node10.push(node8b)
  end

  def test_returns_true_if_left_link_exists
    node2 = Node.new(2)
    node3 = Node.new(3)
    node1 = Node.new(1)

    node2.push(node3)
    node2.push(node1)

    assert node2.left_link_exists
  end

  def test_returns_false_if_left_link_does_not_exist
    node2 = Node.new(2)
    node3 = Node.new(3)

    node2.push(node3)

    refute node2.left_link_exists
  end

  def test_returns_true_if_right_link_exists
    node2 = Node.new(2)
    node3 = Node.new(3)
    node1 = Node.new(1)

    node2.push(node3)
    node2.push(node1)

    assert node2.right_link_exists
  end

  def test_returns_false_if_right_link_does_not_exist
    node2 = Node.new(2)
    node1 = Node.new(1)

    node2.push(node1)

    refute node2.right_link_exists
  end

  def test_returns_true_if_only_left_link_exists
    node2 = Node.new(2)
    node1 = Node.new(1)

    node2.push(node1)

    assert node2.only_left_link_exists
  end

  def test_returns_false_to_only_left_if_both_links_exist
    node2 = Node.new(2)
    node3 = Node.new(3)
    node1 = Node.new(1)

    node2.push(node3)
    node2.push(node1)

    refute node2.only_left_link_exists
  end

  def test_returns_true_if_only_right_link_exists
    node2 = Node.new(2)
    node3 = Node.new(3)

    node2.push(node3)

    assert node2.only_right_link_exists
  end

  def test_returns_false_to_only_right_if_both_links_exist
    node2 = Node.new(2)
    node3 = Node.new(3)
    node1 = Node.new(1)

    node2.push(node3)
    node2.push(node1)

    refute node2.only_right_link_exists
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

    assert_equal false, node10.equal_to?(3)
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

    assert_equal false, node10.equal_to?(18)
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

  def test_raises_exception_if_value_doesnt_exist
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)

    node10.push(node8)
    node10.push(node14)

    exception = assert_raises("RuntimeError") {node10.depth(9)}
    assert_equal("Value does not exist in tree", exception.message)
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

  def test_returns_depth_of_child_node
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

    assert_equal 3, node10.depth(12)
  end

  def test_single_node_returns_a_count_of_one
    node = Node.new(10)

    assert_equal 1, node.count
  end

  def test_returns_two_if_node_has_left_link_only
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal 2, node1.count
  end

  def test_returns_two_if_node_has_right_link_only
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal 2, node1.count
  end

  def test_returns_three_if_node_has_both_links
    node1 = Node.new(10)
    node2 = Node.new(12)
    node3 = Node.new(8)

    node1.push(node2)
    node1.push(node3)

    assert_equal 3, node1.count
  end

  def test_returns_correct_number_of_nodes_in_three_layer_tree
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

    assert_equal 7, node10.count
  end

  def test_sort_outputs_data_from_single_node_in_an_array
    node = Node.new(10)

    assert_equal [10], node.sort
  end

  def test_sorts_node_with_only_left_link
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal [8, 10], node1.sort
  end

  def test_sorts_node_with_only_right_link
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal [10, 12], node1.sort
  end

  def test_sorts_node_with_left_and_right_links
    node1 = Node.new(10)
    node2 = Node.new(12)
    node3 = Node.new(8)

    node1.push(node2)
    node1.push(node3)

    assert_equal [8, 10, 12], node1.sort
  end

  def test_sorts_nodes_down_to_layer_three
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

    assert_equal [6, 8, 9, 10, 12, 14, 16], node10.sort
  end

  def test_sorts_nodes_with_long_left_branch
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)
    node5 = Node.new(5)
    node3 = Node.new(3)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)
    node10.push(node5)
    node10.push(node3)

    assert_equal [3, 5, 6, 8, 9, 10, 12, 14, 16], node10.sort
  end

  def test_sorts_nodes_with_long_right_branch
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)
    node18 = Node.new(18)
    node20 = Node.new(20)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)
    node10.push(node18)
    node10.push(node20)

    assert_equal [6, 8, 9, 10, 12, 14, 16, 18, 20], node10.sort
  end

  def test_returns_longest_height_if_left_is_longest
    node = Node.new(10)
    assert_equal 6, node.return_longest_height(6, 4)
  end

  def test_returns_longest_height_if_right_is_longest
    node = Node.new(10)
    assert_equal 6, node.return_longest_height(4, 6)
  end

  def test_reports_max_height_of_one_if_tree_has_one_node
    node = Node.new(10)

    assert_equal 1, node.max_height
  end

  def test_reports_max_height_of_two_if_tree_has_left_link_only
    node1 = Node.new(10)
    node2 = Node.new(8)

    node1.push(node2)

    assert_equal 2, node1.max_height
  end

  def test_reports_max_height_of_two_if_tree_has_right_link_only
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal 2, node1.max_height
  end

  def test_reports_max_height_of_two_if_tree_has_both_links
    node1 = Node.new(10)
    node2 = Node.new(12)
    node3 = Node.new(8)

    node1.push(node2)
    node1.push(node3)

    assert_equal 2, node1.max_height
  end

  def test_reports_max_height_of_three_for_layer_three_tree
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node12 = Node.new(12)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node12)

    assert_equal 3, node10.max_height
  end

  def test_reports_max_height_of_five_for_tree_with_long_right_branch
    node10 = Node.new(10)
    node8 = Node.new(8)
    node14 = Node.new(14)
    node9 = Node.new(9)
    node6 = Node.new(6)
    node12 = Node.new(12)
    node16 = Node.new(16)
    node18 = Node.new(18)
    node20 = Node.new(20)

    node10.push(node8)
    node10.push(node14)
    node10.push(node9)
    node10.push(node6)
    node10.push(node12)
    node10.push(node16)
    node10.push(node18)
    node10.push(node20)

    assert_equal 5, node10.max_height
  end

  def test_deletes_left_node_with_no_links
    node1 = Node.new(10)
    node2 = Node.new(6)

    node1.push(node2)

    assert_equal node2, node1.left

    node1.delete(6)

    refute node1.left
  end

  def test_deletes_right_node_with_no_links
    node1 = Node.new(10)
    node2 = Node.new(12)

    node1.push(node2)

    assert_equal node2, node1.right

    node1.delete(12)

    refute node1.right
  end
end
