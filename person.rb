require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    @age >= 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end

person1 = Person.new(12, 'Andre')
puts person1.name
puts person1.age
puts person1.id
puts person1.can_use_services?
puts person1.correct_name
