class Bootcamp
    private
    attr_reader :student_capacity, :grades

    public
    attr_reader :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = [] }
    end

    def hire(applicant)
        teachers << applicant
    end

    def enroll(student)
        if students.count < student_capacity
            students << student
            return true
        end
        false
    end

    def enrolled?(student)
        students.include?(student)
    end

    def student_to_teacher_ratio
        students.count / teachers.count
    end

    def add_grade(student, grade)
        if enrolled?(student)
            grades[student] << grade
            return true
        end
        false
    end

    def num_grades(student)
        grades[student].count
    end

    def average_grade(student)
        student_grades = grades[student]
        unless student_grades.empty? || !enrolled?(student)
            student_grades.sum / num_grades(student)
        end
    end
end
