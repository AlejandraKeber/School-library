class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    person.rentals << self unless person.rentals.include?(self)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => date,
      'person' => person,
      'book' => book,
    }.to_json(*args)
  end
end
