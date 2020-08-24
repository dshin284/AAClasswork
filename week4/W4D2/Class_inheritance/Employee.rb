class Employee
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    protected
    def bonus(multipler)
        bonus = (@salary) * multipler
    end

    #private
    def greeting
        puts "hello"
    end
end