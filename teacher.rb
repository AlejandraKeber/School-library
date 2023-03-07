require_relative './person'

class Teacher < Person
  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  attr_accessor :specialization

  def can_use_services?
    true
  end
end

teacher1 = Teacher.new(43, 'Masters', name: 'Alejandra')
puts teacher1.name
puts teacher1.age
puts teacher1.specialization
puts teacher1.can_use_services?
