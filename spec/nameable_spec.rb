require_relative './../modules/nameable'

describe '#correct_name' do
  nameable = Nameable.new
  it 'takes parameters and return correct name' do
    expect do
      nameable.correct_name
    end.to raise_error('NotImplementedError')
  end
end
