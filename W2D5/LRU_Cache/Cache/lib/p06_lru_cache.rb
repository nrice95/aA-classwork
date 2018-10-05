require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count, :map, :store, :max, :prc
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    #case 1 => key already included
    index = key.hash % self.max
    node = self.map[index]
    if !node.nil?
      update_node!(node)
    else
      calc!(key)
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

    #remove relevant items from hash and LL
    eject! if self.map.count == max

    #add newest pair to hash
    self.map.set(key,new_node)

  end

  def update_node!(node) # suggested helper method; move a node to the end of the list

    #remove da node
    tmp = node.remove

    #re-place da node
    self.store.append(tmp.key,tmp.val)

  end

  def eject!
    #remove from linked list
    tmp_key = head.next.key
    head.next.next.prev = head
    head.next = head.next.next

    #remove from hash
    self.map.delete(tmp_key)
  end
end
