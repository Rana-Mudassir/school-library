require_relative '../student'
require_relative '../classroom'

RSpec.describe Student do
  before :each do
    @student = Student.new('age', 'name')
  end

  describe '#new' do
    it 'takes two arguments and returns a Student object' do
      expect(@student).to be_an_instance_of(Student)
    end

    it 'creates a new Student object with the given age, name, parent permission, and classroom' do
      classroom = Classroom.new('Math')
      student = Student.new(16, 'John Doe', parent_permission: true, classroom: classroom) # rubocop:disable Style/HashSyntax

      expect(student.age).to eq(16)
      expect(student.name).to eq('John Doe')
      expect(student.parent_permission).to be true
      expect(student.classroom).to eq(classroom)
    end

    it 'assigns the student to the specified classroom' do
      classroom = Classroom.new('English')

      @student.classroom = classroom

      expect(@student.classroom).to eq(classroom)
      expect(classroom.students).to include(@student)
    end

    it 'returns a string indicating the student is playing hooky' do
      expect(@student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end
end
