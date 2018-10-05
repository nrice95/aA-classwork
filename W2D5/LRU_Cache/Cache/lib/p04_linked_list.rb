# require 'enumerable'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head , :tail

  def initialize

    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    self.head.next
  end

  def last
    self.tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    temp = iterator(key)
    return temp.val unless temp.nil?
    nil
  end

  def include?(key)
    return false if get(key).nil?
    true
  end

  def append(key, val)
    addition = Node.new(key,val)
    tail.prev.next = addition
    addition.prev = tail.prev
    addition.next = tail
    tail.prev = addition
    addition
  end

  def update(key, val)
    temp = iterator(key)
    temp.val = val unless temp.nil?
    temp
  end

  def remove(key)
    temp = iterator(key)
    temp.remove unless temp.nil?
    temp
  end

  def iterator(key)
    ptr = first
    until ptr == self.tail
      return ptr if ptr.key == key
      ptr = ptr.next
    end
    nil
  end

  def each
    ptr = first
    until ptr == self.tail
      yield(ptr)
      ptr = ptr.next
    end
    self.head
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
