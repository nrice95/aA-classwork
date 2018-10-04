def my_min_comparison(arr) #n^2 time complexity
  (0...arr.length).each do |i|
    temp_arr = arr.take(i - 1) + arr.drop(i)
    return arr[i] if temp_arr.all? {|el| el > arr[i]}
  end
end

def my_min_once(arr) #n time complexity
  min = arr[0]
  arr[1..-1].each do |el|
    min = el if el < min
  end
  min
end

def largest_contiguous_subsum(list)
  arrays = []
  list.each_index do |i|
    (i...list.length).each do |j|
      arrays << list[i..j]
    end
  end

  max = 0
  arrays.each do |array|
    max = array.reduce(:+) if max < array.reduce(:+)
  end
  max
end
require 'byebug'

def largest_better(list)
  # byebug
  max = 0
  current_total = 0
  list.each do |el|
    current_total += el
    max = current_total unless current_total < max
    current_total = 0 if current_total <= 0
  end
  max
end
