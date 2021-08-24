require_relative "employee"

class Manager < Employee
    attr_reader :employees

    def initialize(name, title, salary, boss = nil)
        super(name, title, salary, boss)
        @employees = []
    end

    def add_employee(employee)
        employee.boss = self
        employees << employee
    end

    def bonus(multiplier)
        total_subordinates_salary * multiplier
    end

    def total_subordinates_salary
        total = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                total += employee.salary + employee.total_subordinates_salary
            else
                total += employee.salary
            end
        end
        total
    end
end
