require_relative 'node'
require 'pry'

class LinkedList
  attr_reader :head_node

  def initialize
    @head_node = nil
  end

  def append(data)
    if @head_node == nil
      @head_node = Node.new(data)#use insert with position count? for multiples
    else
      append_check_next_node(@head_node, data)
    end
  end

  def prepend(data)
    if @head_node == nil
      @head_node = Node.new(data)#use insert with position 1? for multiples
    else
      prepend_new_node(data)
    end
  end

  def all
    if @head_node == nil
      []
    else
      array = []
      all_check_next_node(@head_node, array)
    end
  end

  def insert(position, data)
    array = data.split
    if @head_node == nil
      array.each do |element| #maybe put this in jungle beats?
        append(element)
      end
    else
      current_position = 1
      insert_check_next_node(array, position, current_position, @head_node)
    end
  end

  def include?(data)
    if @head_node == nil
      false
    elsif @head_node.data == data
      true
    elsif @head_node.next_node == nil
      false
    else
      include_next_node?(@head_node.next_node, data)
    end
  end

  def pop(num)
    array = []
    num.times do
      if @head_node == nil
        "There is nothing to pop"
      elsif @head_node.next_node == nil
        array << @head_node.data
        @head_node = nil
      else
        array << pop_the_last_node(@head_node)
      end
    end
    array.reverse.join(" ")
  end

  def count
    if @head_node == nil
      0
    else
      count_next_node(@head_node, 1)
    end
  end

  private

  def count_next_node(node, position)
    if node.next_node == nil
      position
    else
      count_next_node(node.next_node, position + 1)
    end
  end

  def pop_the_last_node(node)
    if node.next_node.next_node == nil
      temp = node.next_node.data
      node.next_node = nil
      temp
    else
      pop_the_last_node(node.next_node)
    end
  end

  def include_next_node?(node, data)
    if node.data == data
      true
    elsif node.next_node == nil
      false
    else
      include_next_node?(node.next_node, data)
    end
  end

  def insert_check_next_node(data, position, current_position, node)
    if current_position == position
      insert_nodes(data, node)
    else
      insert_check_next_node(data, position, current_position + 1, node.next_node)
    end
  end

  def insert_nodes(data, node)
    #binding.pry
    temp = node.next_node
    node.next_node = nil
    data.each do |element|
      append_check_next_node(node, element)
    end
    insert_reconnect_rest_of_list(node, temp)
  end

  def insert_reconnect_rest_of_list(node, list)
    if node.next_node == nil
      node.next_node = list
    else
      insert_reconnect_rest_of_list(node.next_node, list)
    end
  end

  def all_check_next_node(node, array)
    array << node.data
    if node.next_node == nil
      array
    else
      all_check_next_node(node.next_node, array)
    end
  end

  def append_check_next_node(node, data)
    if node.next_node == nil
      node.next_node = Node.new(data)
    else
      append_check_next_node(node.next_node, data)
    end
  end

  def prepend_new_node(data)
    node = Node.new(data)
    node.next_node = @head_node
    @head_node = node
  end
end
