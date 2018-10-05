class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = sum_ascii(self) #sum is a Fixnum
    sum.hash
  end

  def sum_ascii(el)
    total = 0

    if el.class == Array
      el.each_with_index do |a,i|
        total += i * sum_ascii(a)
      end
    elsif el.class == String
      el.each_byte do |c|
        total += c
      end
    elsif el.class == Fixnum
      total += el
    elsif el.class == Hash
      total += sum_ascii(el.to_a)
    end

    total

  end
end

class String
  def hash
    str_arr = self.chars #str_arr is an Array
    str_arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_arr = self.to_a.sort #hash_arr is an Array
    hash_arr.hash
  end
end
