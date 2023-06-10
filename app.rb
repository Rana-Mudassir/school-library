require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'person'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'There are no books'
    else
      puts 'List of books:'
      @books.each do |book|
        puts "Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'There are no people'
    else
      puts 'List of people:'
      @people.each do |person|
        puts "ID: #{person.id}, Name: #{person.correct_name}, Age: #{person.age}"
      end
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Does the student have permission? [true/false]: '
    parent_permission = gets.chomp.downcase == 'true'
    print "Enter student's classroom (optional): "
    classroom = gets.chomp
    class_name = Classroom.new(classroom)
    # rubocop:disable Lint/HashSyntax
    student = Student.new(age, name, parent_permission: parent_permission, classroom: class_name)
    @people << student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Does the teacher have permission? [true/false]: '
    parent_permission = gets.chomp.downcase == 'true'
    print 'Enter teacher\'s specialization (optional): '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, parent_permission: parent_permission, specialization: specialization)
    # rubocop:enable Lint/HashSyntax
    @people << teacher
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    type = gets.chomp.to_i

    case type
    when 1
      create_student
      puts 'Student has been successfully created'
    when 2
      create_teacher
      puts 'Teacher has been created successfully'
    else
      puts 'Invalid person type, please choose either student (1) or teacher (2).'
    end
  end

  def create_book
    print 'Enter book title: '
    title = gets.chomp
    print 'Enter author\'s name: '
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    puts "Book #{new_book.title} has been successfully created"
  end

  def create_rental
    if @people.empty?
      puts 'Person not found'
    elsif @books.empty?
      puts 'Book not found'
    else
      display_book_list
      book_choice = get_request('Book number: ', :to_i)

      display_person_list
      person_choice = get_request('Person number: ', :to_i)

      date = get_request('Date [YYYY-MM-DD || YYYY/MM/DD]: ')

      rent_book(date, @books[book_choice], @people[person_choice - 1])
      puts 'Rental created successfully'
    end
  end

  def display_book_list
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title} Author: #{book.author}"
    end
  end

  def display_person_list
    puts 'Select a person from the list below by number'
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.correct_name} Id: #{person.id} Age: #{person.age}"
    end
  end

  def get_request(prompt, conversion = :to_s)
    print prompt
    gets.chomp.send(conversion)
  end

  def rent_book(date, book, person)
    rental = Rental.new(date, book, person)
    @rentals << rental
  end

  def list_rentals(person_id)
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found'
    else
      puts "Rentals for person: #{person.correct_name}"
      rentals = @rentals.select { |r| r.person == person }
      rentals.each do |rental|
        puts "Book: #{rental.book.title}, Date: #{rental.date}"
      end
    end
  end

  private

  def generate_person_id
    @people.size + 1
  end
end
