class Array

  def remove_dups

    hash = Hash.new(0)
    self.each do |ele|
      hash[ele] += 1
    end

    hash.keys

  end

  def two_sum
    array = []
    self.each_with_index do |num, idx|
      self.each_with_index do |num2, idx2|
        array << [idx, idx2] if idx < idx2 && num + num2 == 0
      end
    end
    array
  end

  def my_transpose

    final_array = []
    (0...self.length).each do |idx1|
      subarray = []
      (0...self.length).each do |idx2|
        subarray << self[idx2][idx1]
      end
      final_array << subarray
    end
    final_array

  end

  def stock_picker
    hash = Hash.new(0)
    self.each_with_index do |buy, idx|
      self.each_with_index do |sell, idx2|
        hash[[idx, idx2]] += sell - buy if idx < idx2
      end
    end
    hash = hash.select{|k, v| v == hash.values.max}
    hash.keys[0]
  end

end