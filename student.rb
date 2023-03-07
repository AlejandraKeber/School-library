require_relative './person'

class Student < Person
  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end

student1 = Student.new(10, 1, name: 'Samuel', parent_permission: true)
puts student1.name
puts student1.age
puts student1.can_use_services?
puts student1.play_hooky
