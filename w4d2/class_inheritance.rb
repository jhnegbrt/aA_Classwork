class Employee


    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss

    end

    def bonus(multiplier)

        ##first multiplier
        if @boss.nil?
            bonus = multiplier * employees.sum
        else
            bonus = @salary * multiplier
        end

        #second multiplier

    end

end

class Manager < Employee

    def initialize(*subordinates)
        @subs = []
        subordinates.each {|sub| @sub << sub}
    end

end