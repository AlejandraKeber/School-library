require_relative '../modules/teacher'
require_relative '../modules/classroom'

describe Teacher do
  before :each do
    @teacher = Teacher.new(25, 'History', name: 'Jane Deer')
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@teacher).to be_instance_of(Teacher)
    end

    it '#can_use_services?' do
      expect(@teacher.can_use_services?).to be true
    end

    it 'Serilizes data correctly with #to_json' do
      json = "{\"json_class\":\"Teacher\",
\"id\":#{@teacher.id},
\"name\":\"Jane Deer\",
\"age\":25,
\"specialization\":\"History\"
}".delete("\n")
      expect(@teacher.to_json).to eql(json)
    end
  end
end
