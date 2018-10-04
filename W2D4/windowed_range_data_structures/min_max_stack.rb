class MinMaxStack
  attr_reader :stack

  def initialize #add min and max value
    @stack = [] #right is bottom, left is top
  end

  def peek
    self.stack.first
  end

  def size
    self.stack.count
  end

  def empty?
    size == 0
  end

  def pop
    self.stack.shift
  end

  def min
    peek[1]
  end

  def max
    peek[2]
  end

  def push(el)
    if empty?
      self.stack.unshift([el, el, el])
    else
      min = peek[1] < el ? peek[1] : el
      max = peek[2] > el ? peek[2] : el
      self.stack.unshift([el, min, max])
    end
  end
end
