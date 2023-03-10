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
  def initialize
    puts 'Welcome to School Library App!'
    @books = []
    @people = []
    @rentals = []
  end

  def menu
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def run
    loop do
      menu
      option = gets.chomp.to_i
      action = ACTIONS[option]

      if action == :break
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
  puts 'list people'
end

def create_person
  puts 'create person'
end

def create_book
  puts 'create book'
end

def create_rental
  puts 'create a rental '
end

def list_rentals
  puts 'List all rentals for a given person id'
end
end
