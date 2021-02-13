def bad_two_sum?(arr, target_sum)

  (0...arr.length).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end

  false

end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

=begin

  brute force: O(n^2)
  arr.each
    arr.each
    end
  end

  sort then iterate then binary search so it's O(nlogn)

=end

# arr = [0, 1, 5, 7]

def okay_two_sum?(arr, target_sum)
  array = arr.sort
  array.each_with_index do |ele, i|
    return true if b_search(array[i+1..-1], target_sum - ele) #== true
  end
  false
end

def b_search(arr, target)
  # nil return
  # mid index
  # target = or < or > mid

  return false if arr.length == 0

  m = arr.length / 2

  if target == arr[m]
    return true
  elsif target > arr[m]
    b_search(arr[m+1..-1], target)
  else
    b_search(arr[0...m], target)
  end

end

# p b_search([2,3,13,15,45,100], 100) # T
# p b_search([2,3,13,15,45,100], 15)  # T
# p b_search([2,3,13,15,45,100], 101) # F
# p b_search([2,3,13,15,45,100], 1)   # F

# p b_search([1,5,7], 10)

p okay_two_sum?(arr, 6)   # T
p okay_two_sum?(arr, 10)  # F

def two_sum_hash(arr, target_sum)       #O(n)

  h = Hash.new(0)
  arr.each do |ele|
    h[ele] += 1
    # h[target_sum - ele] += 1
  end

  h.each do |k, v|
    h.has_key?(target_sum - k)
  end

end

# [4 4 4] (8)

# [3, 4, 5, 5] 11
