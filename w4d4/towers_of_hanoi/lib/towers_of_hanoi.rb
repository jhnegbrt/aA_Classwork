class Game

  attr_accessor :stacks

  def initialize
    @stacks = [[4, 3, 2, 1],[],[]]
  end

  def won?
    stacks == [[],[],[4, 3, 2, 1]]
  end

end