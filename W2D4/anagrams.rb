require "byebug"

def all_anagrams(string) #O(n*n!)
  result = []
  return [string] if string.length <= 1

  string.each_char.with_index do |char,i|
    sub_string = string[0...i] + string[i+1..-1]
    sub_anagrams = all_anagrams(sub_string)
    sub_anagrams.each do |sub_anagram|
      result << char + sub_anagram
    end
  end
  result
end

def anagram1?(str1,str2) #O(n!)
  return false if str1.length != str2.length
  anagrams = all_anagrams(str1)
  anagrams.include?(str2)
end

def anagram2?(str1,str2) #O(n^2)
  # byebug
  str2_arr = str2.chars
  str1.each_char do |char|
    return false if str2_arr.count == 0
    index = str2_arr.find_index(char)
    return false if index.nil?
    str2_arr.delete_at(index)
  end
  str2_arr.count == 0
end

def anagram3?(str1, str2) #nlogn
  str1.chars.sort == str2.chars.sort
end

def anagram4?(str1, str2) #n
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash2[char] += 1
  end
  hash1 == hash2
end

def anagram5?(str1, str2) #n
  hash = Hash.new(0)
  str1.each_char do |char|
    hash[char] += 1
  end
  str2.each_char do |char|
    hash[char] -= 1
  end
  hash.values.all? {|v| v == 0}
end
