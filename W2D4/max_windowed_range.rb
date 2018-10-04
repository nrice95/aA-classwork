require_relative 'windowed_range_data_structures/min_max_stack_queue'
require 'byebug'
def naivety(arr,w)#(n-w) * nlogn
  current_max_range = 0
  (0..arr.length - w).each do |start_idx|
    tmp_max = max_range(arr[start_idx...start_idx+w])
    current_max_range = tmp_max if tmp_max > current_max_range
  end
  current_max_range
end

def max_range(sub_arr) #nlogn
  sub_arr = sub_arr.sort
  sub_arr.last - sub_arr.first
end

def less_naive(arr, w)
  # byebug
  new_sq = MinMaxStackQueue.new
  max_range = 0
  (0...arr.length).each do |idx|
    el = arr[idx]
    new_sq.enqueue(el)
    range = new_sq.max - new_sq.min
    max_range = range if range > max_range
    new_sq.dequeue if new_sq.size == w
  end
  max_range
end

less_naive([1, 0, 2, 5, 4, 8], 4)

# def less_naive_slices(arr, w) #for sub-windows
#   max_range = 0
#   (0..arr.length - w).each do |start_idx|
#     new_sq = MinMaxStackQueue.new
#     window = arr[start_idx...start_idx + w]
#     new_sq.enqueue(window)
#     range = new_sq.max - new_sq.min
#     max_range = range if range > max_range
#   end
#   max_range
# end
