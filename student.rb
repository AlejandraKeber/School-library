require './person'

class Student < Person
  def initialize(age, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
  end
  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
