require_relative 'employee.rb'
require 'byebug'

class Manager < Employee 
    attr_reader :employees
    def initialize(name, title, salary, boss, employees = []) #takes in five args, employee super class only expected 4 
        @employees = employees #needed additional instance variable to account for characteristic outside of the super class 
        super(name, title, salary, boss) #have to call all four super instance variables on super explicitly because we are passing five args to manager class
    end 

    def mgr_bonus(multiplier)
        sum = 0
        # debugger 
       employees.each do |person| 
        sum += person.salary #do this first because if the person is a manager, we still want to account for their salary
        if person.is_a? Manager 
            sum += person.mgr_bonus(1) #multiply by one because you don't want to take the bonus multipler into account here. 
        end 
       end 
       sum * multiplier
    end 
end 

anna = Employee.new("Anna", "developer", 75_000, "Chris")
autumn = Employee.new("Autumn", "developer", 75_000, "Chris")
john = Employee.new("John", "tech", 50_000, "Anna")
oliver = Manager.new("Oliver", "boss", 100_000, "Deb", [anna, autumn])
deb = Manager.new("Deb", "CEO", 150_000, nil, [oliver, john])

puts deb.mgr_bonus(3)