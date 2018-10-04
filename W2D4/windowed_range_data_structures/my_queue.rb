class MyQueue
  attr_reader :queue
  def initialize
    @queue = [] #left is front, right is back
  end

  def enqueue(el)
    self.queue << el
  end

  def dequeue
    self.queue.shift
  end

  def peek
    self.queue.first
  end

  def size
    self.queue.count
  end

  def empty?
    size == 0
  end
end
