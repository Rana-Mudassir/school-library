require_relative '../teacher'

RSpec.describe Teacher do
  before :each do
    @teacher = Teacher.new('age', 'name')
  end

  describe '#new' do
    it 'takes two arguments and returns a Teacher object' do
      expect(@teacher).to be_an_instance_of(Teacher)
    end

    it 'creates a new Teacher object with the given age, name, parent permission, and specialization' do
      teacher = Teacher.new(35, 'Jane Smith', parent_permission: true, specialization: 'Math')

      expect(teacher.age).to eq(35)
      expect(teacher.name).to eq('Jane Smith')
      expect(teacher.parent_permission).to be true
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teachers' do
      expect(@teacher.can_use_services?).to be true
    end
  end
end
