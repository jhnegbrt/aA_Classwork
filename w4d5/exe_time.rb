list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)   #=>  -5


def my_min(arr) # O(n^2)
  num = arr[0]
  arr.each do |num1|
    arr.each do |num2|
      new_num = (num2 > num1 ? num1 : num2)
      if num > new_num
        num = new_num
      end
    end
  end
  num
end

# p my_min(list) #== -5

def my_min_v2(arr) # O(n)
  num = arr[0]
  arr.each { |int| num = int if int < num }
  num
end

# p my_min_v2(list) == -5

# -------------------------------------------------------

list = [5, 3, -7]
    # largest_contiguous_subsum(list) 
list2 = [2, 3, -6, 7, -6, 7]

def largest_contiguous_subsum(arr) # O(n^3)
  array = []
  i = 0
  while i < arr.length
    j = i
    while j < arr.length
      array << arr[i..j]
      j += 1
    end
    i += 1
  end
  array.map { |ele| ele.sum }.max # n^2 length iteration (ele.sum is a O(n))
end

# p largest_contiguous_subsum(list) == 8

def largest_contiguous_subsum_v2(arr) # O(n)

  largest_sum = arr[0]
  current_sum = arr[0]
  
  (1...arr.length).each do |i|
    if current_sum < 0
      if current_sum < arr[i]
        current_sum = arr[i]
      end
    else
      current_sum += arr[i]
    end
    if current_sum > largest_sum
      largest_sum = current_sum
    end
  end
  largest_sum
end

list = [2, 3, -2, 4, -6, 7]
p largest_contiguous_subsum_v2(list)


