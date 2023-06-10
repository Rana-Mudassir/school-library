require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_reader :classroom, :parent_permission

  def initialize(age, name = 'unknown', parent_permission: true, classroom: nil)
    # rubocop:disable Lint/HashSyntax
    super(age, name, parent_permission: parent_permission)
    # rubocop:enable Lint/HashSyntax
    self.classroom = classroom
  end

  def classroom=(classroom)
    return if @classroom == classroom

    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.students << self
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
