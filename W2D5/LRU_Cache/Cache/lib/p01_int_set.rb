class MaxIntSet
  attr_accessor :store, :max
  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    raise_out_of_bounds_error(num)
    self.store[num] = true
  end

  def remove(num)
    raise_out_of_bounds_error(num)
    self.store[num] = false
  end

  def include?(num)
    raise_out_of_bounds_error(num)
    return true if self.store[num] == true
    false
  end

  private

  def raise_out_of_bounds_error(num)
    raise "Out of bounds" unless is_valid?(num)

  end

  def is_valid?(num)
    num < self.max && num >= 0
  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    self.store[index]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :load_factor, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @load_factor = 2
  end

  def insert(num)
    unless include?(num)
      self.count += 1
      self[num] << num
      resize! if self.count == num_buckets - 1
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      self.count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    index = num % num_buckets
    self.store[index]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = num_buckets * self.load_factor
    new_store = Array.new(new_num_buckets) {Array.new}
    self.store.each do |bucket|
      bucket.each do |el|
        new_idx = el % new_num_buckets
        new_store[new_idx] << el
      end
    end
    self.store = new_store
  end
end
