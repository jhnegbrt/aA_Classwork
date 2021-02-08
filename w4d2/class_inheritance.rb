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

end

class Manager < Employee

  attr_reader :subs

  def initialize(name, title, salary, boss, subordinates)
    super(name, title, salary, boss)
    @subs = []
    subordinates.each {|sub| @sub << sub}
  end

  def bonus(multiplier)
    sum = 0
    self.subs.each do |sub|
      if sub.instance_of(Manager)
        sub.bonus * multiplier
      else
        sum += sub.salary
      end
    end
    bonus = multiplier * sum
  end

end

david = Employee.new("David", "TA", 10000, darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)

darren = Manager.new("Darren", "TA Manager", 78000, ned, [david, shawna])

ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])


ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000
