require 'date'
require './rental'

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end
  attr_accessor :title, :author
  attr_reader :rentals

  def add_rental(person, date)
    @rentals.push(Rental.new(date, person, self))
  end
end
