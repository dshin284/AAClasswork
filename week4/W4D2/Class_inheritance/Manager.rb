require_relative "Employee"
class Manager < Employee

    attr_reader :subordinateArr

    def initialize(name, title, salary, boss)
        @subordinateArr = []
        #Calls the def initialize in the Employee class
        #Set the name, title, salary, and boss from the Employee's
        #initialize.
        #Only calls one level upward.
        super(name, title, salary, boss)
    end

    def populate_subordinates(employee)
        subordinateArr << employee
    end
    
    def hi(employee)
        #hi method is part of subclass Manager and can access
        #the greeting method in the superclass Employee.
        #Objects in the int main() function can't access greeting method
        #directly.
        
        #Greeting (below) still runs regardless if greeting in Employee class is private
        #or protected.
        #greeting
        
        #Greeting will only run if greeting method is protect in Employee class.
        #If greeting is private in Employee class it will not run.
        employee.greeting
    end

    # hidden method - manager has its own 
    # def greeting method

    def bonus(multiplier)
        bonus = 0
        subordinateArr.each do |subordinate|
            bonus += subordinate.bonus(multiplier) 
        end
        return bonus * multiplier
    end
end

if __FILE__ == $0
    # name, title, salary, boss)
    shawna = Employee.new("Shawna", "TA", 12000,"Darren")
    ned = Manager.new("Ned","Founder", 1000000, nil)
    darren = Manager.new("Darren","TA Manager", 78000, "Ned")
    david = Employee.new("David","TA", 10000, "Darren")
    
   ned.populate_subordinates(darren)
   darren.populate_subordinates(shawna)
   darren.populate_subordinates(david)
   
   p ned.bonus(1000)
   p darren.bonus(10)
   #p shawna.bonus(1.2)
   #p david.bonus(1.2)

   #p ned.greeting
   p ned.hi(david)
end