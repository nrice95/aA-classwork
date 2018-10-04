require_relative 'min_max_stack'

class MinMaxStackQueue
  attr_reader :stack_1, :stack_2

  def initialize
    @stack_1 = MinMaxStack.new
    @stack_2 = MinMaxStack.new
  end

  def size
    stack_1.size + stack_2.size
  end

  def empty?
    size == 0
  end

  def min
    if stack_2.empty? || !stack_1.empty?
      flip
    end
    stack_2.min
  end

  def max
    if stack_2.empty? || !stack_1.empty?
      flip
    end
    stack_2.max
  end

  def enqueue(val)
    stack_1.push(val)
  end

  def dequeue
    flip if stack_2.empty?
    stack_2.pop
  end

  def flip
    until stack_1.empty?
      stack_2.push(stack_1.pop)
    end
  end

  # popped = self.stack_1.pop
  # self.stack_2.push(popped)
  #
  # if self.stack_1.empty?
  #   self.stack_1, self.stack_2 = self.stack_2, self.stack_1
  # end
end
