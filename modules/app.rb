require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './menu'
require_relative './data_persistance'
require 'pry'
require 'json'

ACTIONS = {
  1 => :list_books,
  2 => :list_people,
  3 => :create_person,
  4 => :create_book,
  5 => :create_rental,
  6 => :list_rentals,
  7 => :break
}.freeze

class App
  include Menu

  def initialize
    puts 'Welcome to School Library App!'
    @books = load_books
    @people = load_people
    @rentals = load_rentals
  end

  def run
    loop do
      menu
      option = gets.chomp.to_i
      action = ACTIONS[option]

      if action == :break
        save
        puts 'Thank you for using this app!'
        break
      elsif action
        send(action)
      else
        puts 'Invalid number, please try again'
      end
    end
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'No people found'
    else
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.to_i
    case option
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp.to_s
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.to_s
      permission = permission.downcase == 'y'
      student = Student.new(age, name, permission)
      puts 'Person created successfully'
      @people.push(student)
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp.to_s
      print 'Specialization: '
      specialization = gets.chomp.to_s
      @people.push(Teacher.new(age, specialization, name: name))
      puts 'Person created successfully'
    else
      puts 'Invalid input, please try again'
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp.to_s
    print 'Author: '
    author = gets.chomp.to_s
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @people[person_index], @books[book_index]))
    puts 'Rental created successfully'
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @people.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  private

  def save
    File.write('people.json', JSON.generate(@people))
    File.write('books.json', JSON.generate(@books))
    File.write('rentals.json', JSON.generate(@rentals))
  end

  def load_people
    return [] unless File.file?('people.json')

    JSON.parse(File.read('people.json')).map do |person|
      if person['json_class'] == 'Student'
        Student.new(person['age'], person['name'], person['parent_permission'])
      elsif person['json_class'] == 'Teacher'
        Teacher.new(person['age'], person['specialization'], name: person['name'])
      end
    end
  end

  def load_books
    return [] unless File.file?('books.json')

    JSON.parse(File.read('books.json')).map do |book|
      Book.new(book['title'], book['author'])
    end
  end

  def load_rentals
    return [] unless File.file?('rentals.json')

    JSON.parse(File.read('rentals.json')).map do |rental|
      person = @people.select { |psn| psn.name == rental['person']['name'] }
      book = @books.select { |bk| bk.title == rental['book']['title'] }
      Rental.new(rental['date'], person[0], book[0])
    end
  end
end
