require_relative 'person'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
