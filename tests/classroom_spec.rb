require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  before :each do
    @classroom = Classroom.new('CS')
  end

  describe '#new' do
    it 'It takes one argument and return Classroom Object' do
      expect(@classroom).to be_an_instance_of(Classroom)
    end

    it 'creates a new Classroom object with the given label' do
      expect(@classroom.label).to eq('CS')
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and assigns the classroom to the student' do
      student = Student.new(16, 'John')

      @classroom.add_student(student)

      expect(@classroom.students).to include(student)
      expect(student.classroom).to eq(@classroom)
    end
  end
end
