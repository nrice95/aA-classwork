require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count, :map, :store, :max, :prc
  def initialize(max, prc)
    @map = HashMap.new(max)
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    node = self.map.get(key)
    if node.nil? #key does not exist in cache
      result = calc!(key)
      return result
    else
      result = update_node!(node)
      return result
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key) # suggested helper method; insert an (un-cached) key

    val = self.prc.call(key)

    #add newest node to linked list
    new_node = self.store.append(key,val)

    #add newest pair to hash
    self.map.set(key,new_node)

    #remove relevant items from hash and LL
    eject! if self.map.count == max + 1

    # puts "!#{new_node.val}!"
    val
  end

  def update_node!(node) # suggested helper method; move a node to the end of the list

    #remove da node
    tmp = node.remove

    #re-add the node
    self.store.tail.prev.next = tmp
    tmp.prev = self.store.tail.prev
    tmp.next = self.store.tail
    self.store.tail.prev = tmp
    tmp

    tmp.val
  end

  def eject!
    #remove from linked list
    tmp_key = self.store.head.next.key
    self.store.head.next.next.prev = self.store.head
    self.store.head.next = self.store.head.next.next

    #remove from hash
    self.map.delete(tmp_key)
  end
end
