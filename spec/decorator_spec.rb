require_relative './../modules/decorator'
require_relative './../modules/nameable'

describe '#new' do
  decorator = Decorator.new('label')
  it 'takes a new decorator object' do
    expect(decorator).to be_instance_of(Decorator)
  end

  it 'returns a nameable object' do
    expect(decorator).to be_kind_of(Nameable)
  end
end
