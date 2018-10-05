require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count, :store
  attr_reader :load_factor

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @load_factor = 2
  end

  def include?(key)
    bucket = bucket(key)
    bucket.include?(key)
  end

  def set(key, val)
    resize! if self.count == num_buckets
    bucket = bucket(key)
    result = bucket.update(key,val)
    if result.nil?
      result = bucket.append(key,val)
      self.count += 1
    end
    result
  end

  def get(key)
    bucket = bucket(key)
    bucket.get(key)
  end

  def delete(key)
    bucket = bucket(key)
    result = bucket.remove(key)
    self.count -= 1 unless result.nil?
  end

  def each
    result = []
    self.store.each do |bucket|
      bucket.each do |node|
        # result << [node.key,node.val]
        yield [node.key,node.val]
      end
    end
    result
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_size = num_buckets * load_factor
    new_store = Array.new(new_size) {LinkedList.new}
    self.each do |el|
      new_bucket_idx = el[0].hash % new_size
      new_store[new_bucket_idx].append(el[0],el[1])
    end
    self.store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    bucket_idx = key.hash % num_buckets
    self.store[bucket_idx]
  end
end
