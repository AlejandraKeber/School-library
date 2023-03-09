class Classroom
  def initialize(label)
    @label = label
    @students = []
  end
  attr_accessor :label
  attr_reader :students

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
