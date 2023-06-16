require 'rspec'
require_relative '../book'

RSpec.describe Book do
  before :each do
    @book = Book.new "title", "author"
  end
  describe "#new" do
    it "takes two parameters and return a new Book object" do
      expect(@book).to be_an_instance_of(Book)
    end

    it "has a title" do
      expect(@book.title).to eq("title")
    end
    
    it "has an author" do
      expect(@book.author).to eq("author")
    end

    it "has an empty rentals array by default" do
      expect(@book.rentals).to be_empty
    end
  end
end
