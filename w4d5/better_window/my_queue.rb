class MyQueue
  def initialize
    @store = []
  end

  # peek, size, empty?, enqueue, and dequeue
  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

  def enqueue(ele)
    @store.unshift(ele)
  end

  def dequeue
    @store.pop
  end
end