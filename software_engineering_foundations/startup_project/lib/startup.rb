require_relative "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.keys.include?(title)
    end

    def >(other_startup)
        funding > other_startup.funding ? true : false
    end

    def hire(employee_name, title)
        unless valid_title?(title)
            raise "sorry, that title is invalid"
        end
        employees << Employee.new(employee_name, title)
    end

    def size
        employees.count
    end

    def pay_employee(employee)
        title = employee.title
        employee_salary = salaries[title]
        if funding >= employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else
            raise "sorry, we don't have enough funding"
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salaries = 0
        employees.each do |employee|
            title = employee.title
            employee_salary = salaries[title]
            total_salaries += employee_salary
        end
        total_salaries / size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        @salaries = other_startup.salaries.merge(salaries)
        employees.concat(other_startup.employees)
        other_startup.close
    end
end