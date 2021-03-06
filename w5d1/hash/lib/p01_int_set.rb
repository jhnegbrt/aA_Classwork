require "byebug"

class MaxIntSet

  attr_reader :store

  def initialize(max)

    @store = Array.new(max, false)

  end

  def insert(num)

    if num >= 0 && num < @store.length
      @store[num] = true
    else
      raise 'Out of bounds'
    end

  end

  def remove(num)

    if num >= 0 && num < @store.length
      @store[num] = false
    else
      raise 'Out of bounds'
    end

  end

  def include?(num)

    if num >= 0 && num < @store.length
      @store[num]
    else
      raise 'Out of Bounds Error'
    end
    
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end

class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    m = num % @store.length
    # p m
    @store[m] << num
    # p @store
  end

  def remove(num)
    m = num % @store.length
    @store[m].delete(m)
  end

  def include?(num)
    m = num % @store.length
    @store[m].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    if !include?(num)
      m = num % num_buckets
      @store[m] << num
      @count += 1
    end
    if @count > num_buckets
      resize!
    end
  end

  def remove(num)
    if include?(num)
      m = num % @store.length
      @store[m].delete(m)
      @count -= 1
    end

  end

  def include?(num)
    m = num % @store.length
    @store[m].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    current_store = @store
    @store = Array.new(num_buckets*2) { Array.new }
    @count = 0
    current_store.each do |subarr|
      subarr.each do |ele|
        insert(ele)
      end
    end

  end

end

#[[1, 1, 1][][]]
#[[2][2][2]]
[[[2]]]

array = [0]
