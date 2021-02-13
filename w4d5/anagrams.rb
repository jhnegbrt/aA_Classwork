# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

def first_anagram?(string, string2) # O(n!) = n! + n! + n
  array = string.split("") # n got dominated
  
  array = array.permutation(string.length).to_a # n!

  array.include?(string2.split("")) # n! cuz iterating thru the array of length n!
end

# p first_anagram?("gizmo", "sally") == false
# p first_anagram?("elvis", "lives") == true


def second_anagram?(string1, string2)         # O(n^2);   O(N * M) if no line 18

  return false if string1.length != string2.length

  array2 = string2.split("")

  string1.each_char do |char|                  # N
    index = array2.index(char)                   # N
    array2.delete_at(index) if !index.nil?       # N 
  end

  array2.empty?

end

# p second_anagram?("elvis", "lives") == true
# p second_anagram?("gizmo", "sally") == false

def third_anagram?(string1, string2)          # n^2(worst case)
  qs(string1) == qs(string2)
end

def qs(str)
  
  return str if str.length <= 1
  alpha = ("a".."z").to_a
  prc = Proc.new { |a, b| alpha.index(a) <=> alpha.index(b) } # a is 0, b is 1,  0 <=> 1 == -1
  array = str.split("")

  pivot_idx = rand(0...array.length)
  pivot = array[pivot_idx]
  array = array[0...pivot_idx] + array[pivot_idx+1..-1]
  left, right = array.partition { |ele| prc.call(ele, pivot) == -1 } # ele a, pivot b, -1
  left = left.join("")
  right = right.join("")
  
  qs(left) + pivot + qs(right)

end

# p qs('bdcaze')
# p third_anagram?("elvis", "lives") #== true
# p third_anagram?("gizmo", "sally") #== false

def fourth_anagram?(string1, string2)    #big O = O(n) time;   space O(1) only 26 keys

  h = Hash.new(0)
  string1.each_char {|char| h[char] += 1 }
  string2.each_char {|char| h[char] -= 1 }

  h.values.all? {|ele| ele == 0}  

end


p fourth_anagram?("elvis", "lives") == true
p fourth_anagram?("gizmo", "sally") == false