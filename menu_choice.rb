class MenuChoice
  def initialize(app, cli)
    @app = app
    @cli = cli
  end

  def execute_action(choice)
    case choice
    when 1
      ListBooks.new(@app).execute
    when 2
      ListPeople.new(@app).execute
    when 3
      CreatePerson.new(@app).execute
    when 4
      CreateBook.new(@app).execute
    when 5
      CreateRental.new(@app).execute
    when 6
      ListRentalsForPerson.new(@app, @cli).execute # Pass @cli instead of self
    end
  end
end

class ListBooks
  def initialize(app)
    @app = app
  end

  def execute
    @app.list_books
  end
end

class ListPeople
  def initialize(app)
    @app = app
  end

  def execute
    @app.list_people
  end
end

class CreatePerson
  def initialize(app)
    @app = app
  end

  def execute
    @app.create_person
  end
end

class CreateBook
  def initialize(app)
    @app = app
  end

  def execute
    @app.create_book
  end
end

class CreateRental
  def initialize(app)
    @app = app
  end

  def execute
    @app.create_rental
  end
end

class ListRentalsForPerson
  def initialize(app, cli)
    @app = app
    @cli = cli
  end

  def execute
    person_id = @cli.get_request('Enter person ID: ', :to_i)
    @app.list_rentals(person_id)
  end
end
