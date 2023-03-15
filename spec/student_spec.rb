require_relative '../modules/student'
require_relative '../modules/classroom'

describe Student do
  before :each do
    @student = Student.new(25, 'John Doe', true)
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@student).to be_instance_of(Student)
    end

    it 'set a classroom #classroom=' do
      classroom = Classroom.new('Math')
      @student.classroom = (classroom)
      expect(@student.classroom).to eq(classroom)
    end

    it '#Play_hooky' do
      expect(@student.play_hooky).to eql('¯\(ツ)/¯')
    end

    it 'Serilizes data correctly with #to_json' do
      json = "{\"json_class\":\"Student\",
\"id\":#{@student.id},\"name\":\"John Doe\",
\"age\":25,
\"parent_permission\":true,
\"classroom\":null}".delete("\n")
      expect(@student.to_json).to eql(json)
    end
  end
end
