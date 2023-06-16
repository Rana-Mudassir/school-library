require_relative 'person'

class Teacher < Person
  attr_reader :parent_permission, :specialization

  def initialize(age, name = 'unknown', parent_permission: true, specialization: nil)
    # rubocop:disable Lint/HashSyntax
    super(age, name, parent_permission: parent_permission)
    # rubocop:enable Lint/HashSyntax
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
