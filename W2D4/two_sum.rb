def bad_two_sum(arr, target) #n^2
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      el1 = arr[i]
      el2 = arr[j]
      return true if el1 + el2 == target
    end
  end
  false
end

def sorting_two_sum(arr, target) #nlogn
  sorted = arr.sort
  i = 0
  j = arr.length - 1
  until j < i
    el1 = arr[i]
    el2 = arr[j]
    if el1 + el2 == target
      return true
    elsif el1 + el2 < target
      i += 1
    else
      j -= 1
    end
  end
  false
end

def hash_map_two_sum(arr, target) #n
  hash = {}
  arr.each do |el|
    hash[el] = true
  end

  hash.keys.each do |key|
    return true if hash.key?(target - key)
  end
  false
end
#
# [0, 1, 5, 7]
# 5
# 0, 7
# 0, 5
# if el1 + el2 < target
#   el1.idx + 1
# elsif el1 + el2 > target
#   el2.idx - 1
# else
