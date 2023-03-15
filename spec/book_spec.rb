require_relative './../modules/book'
require_relative './../modules/person'
require_relative './../modules/rental'

describe '#new' do
  book = Book.new('title', 'author')
  it 'takes a new book object' do
    expect(book).to be_instance_of(Book)
  end
end

describe '#add_rental' do
  book = Book.new('title', 'author')
  person = Person.new('Test', 20, 'parent_permission: true')
  date = '12/12/2023'
  book.add_rental(person,date)
  rental = Rental.new(date, person, book)
    it 'should push data to rentals' do
      expect(book.rentals.length).to be > 0 
    end
end

describe '#to_json' do
book = Book.new('title', 'author')
  it 'convert to JSON' do
    expect(book.to_json).to include('author')
  end
end