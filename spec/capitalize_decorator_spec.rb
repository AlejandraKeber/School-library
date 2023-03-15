require_relative './../modules/capitalize_decorator'
require_relative './../modules/person'

describe '#correct_name' do
  person = Person.new(23, 'juan', parent_permission: true)
  capitalized_person = CapitalizeDecorator.new(person)
  it 'returns capitalized name' do
    expect(capitalized_person.correct_name).to eql('Juan')
  end
end
