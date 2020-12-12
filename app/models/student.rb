class Student
    attr_reader :first_name
    @@all = []

    def initialize (first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end
    
    def self.find_student(first_name)
        self.all.find {|element| element.first_name == first_name}
    end

    def add_boating_test(boating_test_name,boating_test_status,instructor)
        BoatingTest.new(self,boating_test_name,boating_test_status,instructor)
    end

    def boating_tests
        BoatingTest.all.select {|boating| boating.student == self}
    end

    def all_instructors 
        self.boating_tests.map(&:instructor).uniq
    end

    def grade_percentage
        # all_tests =  []
        all_tests = self.boating_tests.map(&:boating_test_status)
        # all_tests_passed = []
        all_tests_passed = all_tests.find_all {|test| test =="passed"}
        all_tests_passed.length.to_f / all_tests.length.to_f
    end

end
