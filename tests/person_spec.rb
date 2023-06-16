require 'rspec'
require_relative '../person'

RSpec.describe Person do
  before :each do
    @person = Person.new 'age', 'name'
  end

  describe '#new' do
    it 'takes 3 arguments and returns Person object' do
      expect(@person).to be_an_instance_of(Person)
    end

    it 'has parent permission by default' do
      expect(@person.parent_permission).to be true
    end

    it 'returns the correct name when name is set' do
      person = Person.new('age', 'John Doe')
      expect(person.correct_name).to eq('John Doe')
    end

    it 'returns true if the person is of age' do
      person = Person.new(20, 'name')
      expect(person.send(:of_age?)).to be true
    end

    it 'returns true if the person can use library service' do
      person = Person.new(20, 'name')
      expect(person.can_use_services?).to be true
    end
  end
end
