def windowed_max_range(array, dif)
  
  current_max_range = nil
  i = 0
  while i < array.length - dif + 1
    difference = array[i...i+dif].max - array[i...i+dif].min
    if current_max_range.nil? 
      current_max_range = difference
    elsif current_max_range < difference
      current_max_range = difference
    end
    i += 1
  end
  current_max_range
end



# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8



