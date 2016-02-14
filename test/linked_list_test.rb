gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/linked_list'
require_relative '../lib/node'
require 'pry'

class LinkedListTest < Minitest::Test

  def test_it_can_be_created
    list = LinkedList.new
    assert_equal LinkedList, list.class
  end

  def test_it_starts_as_an_empty_list
    list = LinkedList.new
    assert_equal nil, list.head_node
  end

  def test_it_can_append_a_head_node
    list = LinkedList.new
    list.append("beep")
    assert_equal Node, list.head_node.class
  end

  def test_it_can_append_two_nodes
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    assert_equal "beep", list.head_node.data
    assert_equal "bop", list.head_node.next_node.data
  end

  def test_it_can_append_many_nodes
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert_equal "beep", list.head_node.data
    assert_equal "bop", list.head_node.next_node.data
    assert_equal "boop", list.head_node.next_node.next_node.data
  end

  def test_it_can_prepend_to_an_empty_list
    list = LinkedList.new
    list.prepend("bop")
    assert_equal "bop", list.head_node.data
  end

  def test_it_can_prepend_an_item_to_the_list
    list = LinkedList.new
    list.append("beep")
    list.prepend("bop")
    assert_equal "bop", list.head_node.data
    assert_equal "beep", list.head_node.next_node.data
  end

  def test_it_can_return_an_array_of_all_elements_in_the_list_in_order
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert_equal ["beep", "bop", "boop"], list.all
  end

  def test_it_can_insert_one_element_into_an_empty_list
    list = LinkedList.new
    list.insert(1, "do")
    assert_equal ["do"], list.all
  end

  def test_it_can_insert_an_element_into_an_empty_list
    list = LinkedList.new
    list.insert(1, "dep deep do")
    assert_equal ["dep", "deep", "do"], list.all
  end

  def test_it_can_insert_an_element_into_the_list
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    list.insert(1, "dep")
    assert_equal ["beep", "dep", "bop", "boop"], list.all
  end

  def test_it_can_insert_many_element_into_the_list
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    list.insert(1, "dep doop dop deep")
    assert_equal ["beep", "dep", "doop", "dop", "deep", "bop", "boop"], list.all
  end

  def test_it_can_check_if_the_list_includes_an_item
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert list.include?("bop")
  end

  def test_it_can_return_false_if_the_list_doesnt_contain_an_item
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    refute list.include?("dep")
  end

  def test_it_can_check_if_an_empty_list_includes_an_item
    list = LinkedList.new
    refute list.include?("dep")
  end

  def test_you_can_pop_the_last_node_off_the_list
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert_equal "boop", list.pop(1)
    assert_equal ["beep", "bop"], list.all
  end

  def test_you_can_pop_the_last_node_off_the_list_of_two
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    assert_equal "bop", list.pop(1)
    assert_equal ["beep"], list.all
  end

  def test_you_can_pop_the_last_node_off_a_of_one
    list = LinkedList.new
    list.append("beep")
    assert_equal "beep", list.pop(1)
    assert_equal [], list.all
  end

  def test_you_can_pop_multiple_items_off_a_list
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert_equal "beep bop boop", list.pop(3)
    assert_equal [], list.all
  end

  def test_you_can_count_the_number_of_nodes_in_a_list
    list = LinkedList.new
    list.append("beep")
    list.append("bop")
    list.append("boop")
    assert_equal 3, list.count
  end

  def test_you_can_count_the_number_of_node_in_an_empty_list
    list = LinkedList.new
    assert_equal 0, list.count
  end

  def test_you_can_count_the_number_of_nodes_in_a_list_of_one
    list = LinkedList.new
    list.append("beep")
    assert_equal 1, list.count
  end
end
