class Employee 
    attr_reader :salary, :name, :title, :boss

    def initialize(name, title, salary, boss)
        @name = name 
        @title = title
        @salary = salary 
        @boss = boss 
    end 

    def bonus(multiplier)
        multiplier * @salary 
    end 
end 