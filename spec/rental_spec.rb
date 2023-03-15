require_relative '../modules/rental'
require_relative '../modules/person'
require_relative '../modules/book'

describe Rental do
  before :each do
    person = Person.new(25, 'John Doe', true)
    book = Book.new('Lord of the Rings', 'Tolkien')
    @rental = Rental.new('12/34/5678', person, book)
  end

  context 'testing methods' do
    it 'Makes a new object' do
      expect(@rental).to be_instance_of(Rental)
    end

    it '#to_json serilizes data correctly' do
      json = "{\"json_class\":\"Rental\",
\"date\":\"12/34/5678\",
\"person\":
{\"json_class\":\"Person\",
\"id\":#{@rental.person.id},
\"name\":\"John Doe\",
\"age\":25,
\"parent_permission\":true
},
\"book\":
{\"json_class\":\"Book\",
\"title\":\"Lord of the Rings\",
\"author\":\"Tolkien\"
}}".delete("\n")
      expect(@rental.to_json).to eql(json)
    end
  end
end
