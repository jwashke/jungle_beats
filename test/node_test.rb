gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/node'

class NodeTest < Minitest::Test
  def test_a_node_can_be_created
    node = Node.new("deep")
    assert_equal Node, node.class
  end

  def test_it_can_hold_data
    node = Node.new("deep")
    assert_equal "deep", node.data
  end

  def test_it_can_hold_a_next_node
    node1 = Node.new("deep")
    node2 = Node.new("deep")
    node1.next_node = node2
    assert_equal node2, node1.next_node
  end
end
