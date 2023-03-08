require './person'

class Student < Person
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name)
    @classroom = classroom
  end

  attr_accessor :classroom

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student1 = Student.new(10, 1, 'Samuel', parent_permission: true)
puts student1.name
puts student1.age
puts student1.can_use_services?
puts student1.play_hooky
puts student1.classroom
