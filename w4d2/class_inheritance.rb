require "byebug"

class Employee
  
  attr_reader :salary, :name, :title, :boss
  
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = @salary * multiplier
  end

  def add_subs
    self.boss.subs << self
    if self.instance_of?(Manager)
      self.subs.each do |ele|
        self.boss.subs << ele
      end
    end
  end

end

class Manager < Employee

  attr_reader :subs

  def initialize(name, title, salary, boss)

    super
    @subs = []
  end


  def bonus(multiplier)
    sum = 0
    self.subs.each do |sub|
      sum += sub.salary
    end
    bonus = multiplier * sum
  end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

david.add_subs
shawna.add_subs
darren.add_subs



p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
