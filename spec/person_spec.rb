require_relative '../modules/person'

describe Person do
  before :each do
    @person = Person.new(25, 'John Doe', true)
  end

  context 'Testing Person methods' do
    it 'Makes a new Person object' do
      expect(@person).to be_instance_of(Person)
    end

    it 'Serilizes data correctly' do
      expect(@person.to_json).to eql("{\"json_class\":\"Person\",
\"id\":#{@person.id},
\"name\":\"John Doe\",
\"age\":25,
\"parent_permission\":true}".delete("\n"))
    end
  end
end
