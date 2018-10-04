require_relative "max_windowed_range"

puts naivety([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
puts naivety([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
puts naivety([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
puts naivety([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
