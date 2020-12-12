class Instructor
    attr_reader :name
    @@all = []
    
    def initialize (name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def passed_students
        passy_testy = BoatingTest.all.select {|boating| (boating.instructor == self) && (boating.boating_test_status == "passed")}
        # binding.pry
        passy_testy.map(&:student).uniq
    end

    def pass_student(student,boating_test_name)
        gonna_pass_this_student = BoatingTest.all.find {|element| (element.student == student) && (element.boating_test_name == boating_test_name)}
        if gonna_pass_this_student
            boating_test_status = "passed"
        else
            BoatingTest.new(student,boating_test_name,"passed",self)
        end
    end

    def all_students
        self.boating_tests.map(&:student).uniq
    end

    def fail_student(student,boating_test_name)
        gonna_fail_this_student = BoatingTest.all.find {|element| (element.student == student) && (element.boating_test_name == boating_test_name)}
        if gonna_fail_this_student
            boating_test_status = "failed"
        else
            BoatingTest.new(student,boating_test_name,"failed",self)
        end
    end


end
