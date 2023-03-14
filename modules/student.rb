require_relative './person'

class Student < Person
  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
