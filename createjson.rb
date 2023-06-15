require 'json'

class CreateJsonBook
  def initialize(app)
    @app = app
  end

  def create_file
    books = @app.books.map { |book| { Title: book.title, Author: book.author } }
    my_book = { Book: books }.to_json
    File.write('books.json', my_book)
  end
end

class CreateJsonPeople
  def initialize(app)
    @app = app
  end

  def create_file
    persons = @app.people.map { |people| { Person: people, Name: people.name, ID: people.id, Age: people.age } }
    my_person = { "Person" => persons }.to_json

    File.write('people.json', my_person)
  end
end

class CreateJsonRental
  def initialize(app)
    @app = app
  end

  def create_file
    rentals = @app.rentals.map { |rental| { Name: rental.book.title, Date: rental.date } }
    my_rental = { "Rentals" => rentals }.to_json

    File.write('rental.json', my_rental)
  end
end
