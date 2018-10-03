require "byebug"

class Array
  def my_uniq
    uniqs = []
    i = 0
    while i < self.length
      uniqs << self[i] unless uniqs.include?(self[i])
      i += 1
    end
    uniqs
  end

  def two_sum

    pairs = []
    # (0...self.length).each do |start_idx|
    #   (start_idx + 1...self.length-1).each do |dist|
    #     if self[start_idx] + self[start_idx + dist] == 0
    #       pairs << [start_idx, start_idx + dist]
    #     end
    #   end
    # end

    self.each_with_index do |ele, i1|
      self.each_with_index do |ele2, i2|
        pairs_idx = [i1, i2]
        if ele + ele2 == 0 && i1 != i2 && !pairs.include?(pairs_idx.reverse)
          pairs << pairs_idx
        end
      end
    end

    pairs

  end

  def my_transpose
    matrix = []

    self.length.times {matrix << Array.new}

    self.each do |sub_arr|
      sub_arr.each_with_index do |el,i|
        matrix[i] << el
      end
    end

    matrix
  end

  def stock_picker
    best_pair = []
    best_profit = 0

    self.each_with_index do |ele1, idx1|
      self.each_with_index do |ele2, idx2|
        if (ele2 - ele1) > best_profit && idx2 > idx1
          best_profit = ele2 - ele1
          best_pair = [idx1, idx2]
        end
      end
    end

    best_pair
    #
    # tmp_lowest_price_idx = 0
    # tmp_lowest_price = self.first
    # tmp_highest_price_idx = 0
    # tmp_highest_price = self.first
    # best_profit = 0
    # best_profit_pair = []
    #
    # self.each_with_index do |price,i|
    #   unless i == self.length
    #     if price - tmp_lowest_price > best_profit
    #       best_profit = price - tmp_lowest_price
    #       tmp_highest_price_idx = i
    #       tmp_highest_price = price
    #       best_profit_pair = [tmp_lowest_price_idx,i]
    #     elsif price < tmp_lowest_price
    #       tmp_lowest_price_idx = i
    #       tmp_highest_price_idx = i
    #       tmp_lowest_price = price
    #       tmp_highest_price = price
    #     end
    #   end
    # end
    # best_profit_pair
  end
end
