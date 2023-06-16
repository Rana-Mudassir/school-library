require_relative '../rental'
require_relative '../book'
require_relative '../person'

RSpec.describe Rental do
  before :each do
    @book = Book.new('Title', 'Author')
    @person = Person.new(20, 'John')
    @rental = Rental.new '2023-06-16', @book, @person
  end

  describe '#new' do
    it 'takes three arguments and return Rental object' do
      expect(@rental).to be_an_instance_of(Rental)
    end

    it 'assigns the given date, book, and person to the corresponding instance variables' do
      expect(@rental.date).to eq('2023-06-16')
      expect(@rental.book).to eq(@book)
      expect(@rental.person).to eq(@person)
    end
  end
end
