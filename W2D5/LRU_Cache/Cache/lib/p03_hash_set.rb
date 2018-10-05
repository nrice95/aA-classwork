class HashSet
  attr_accessor :count, :load_factor, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @load_factor = 2
  end

  def insert(key)
    unless include?(key)
      self.count += 1
      self[key] << key
      resize! if self.count == num_buckets - 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](key)
    # optional but useful; return the bucket corresponding to `num`
    index = key.hash % num_buckets
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
