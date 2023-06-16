require 'json'

class CreateJsonBook
  def initialize(app)
    @app = app
  end

  def create_file
    my_book = {}
    books = []
    @app.books.each do |book|
      single_boook = { Title: book.title, Author: book.author }
      books.push(single_boook)
    end
    my_book = { Book: books }.to_json
    open('books.json', 'a') do |file|
      file.puts my_book
    end
  end
end

class CreateJsonPeople
  def initialize(app)
    @app = app
  end

  def create_file
    my_person = {}
    persons = []
    @app.people.each do |people|
      single_person = { Person: people, Name: people.name, ID: people.id, Age: people.age }
      persons.push(single_person)
    end
    my_person = { Person: persons }.to_json
    open('people.json', 'a') do |file|
      file.puts my_person
    end
  end
end

class CreateJsonRental
  def initialize(app)
    @app = app
  end

  def create_file
    my_rental = {}
    rentals = []
    @app.rentals.each do |rental|
      single_rental = { Name: rental.book.title, Date: rental.date }
      rentals.push(single_rental)
    end

    my_rental = { Rentals: rentals }.to_json
    open('rental.json', 'a') do |file|
      file.puts my_rental
    end
  end
end
