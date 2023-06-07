require_relative 'person'

class Teacher < Person
  attr_reader :parent_permission, :specialization

  def initialize(age, name = 'unknown', parent_permission: true, specialization: nil)
    super(name, age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
