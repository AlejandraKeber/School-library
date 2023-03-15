require_relative './../modules/classroom'
require_relative './../modules/student'

describe '#new' do
  classroom = Classroom.new('label')
  it 'takes a new classroom object' do
    expect(classroom).to be_instance_of(Classroom)
  end
end

describe '#add_student' do
  classroom = Classroom.new('Math')
  student = Student.new(20, 'Name', 'parent_permission: true')
  classroom.add_student(student)

  it 'should push data to student' do
    expect(classroom.students.length).to be > 0
  end
end
