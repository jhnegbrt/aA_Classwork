class Employee
  
  attr_reader :salary
  
  def initialize(name, title, salary, boss)
      @name = name
      @title = title
      @salary = salary
      @boss = boss
  end

  def bonus(multiplier)
      if self.instance_of?(Manager)
          sum = 0
          self.subs.each { |sub| sum += sub.salary }
          bonus = multiplier * sum
      else
          bonus = @salary * multiplier
      end
  end

end

class Manager < Employee

  attr_reader :subs

  def initialize(name, title, salary, boss, subordinates)
    super(name, title, salary, boss)
    @subs = []
    subordinates.each {|sub| @sub << sub}
  end

end

