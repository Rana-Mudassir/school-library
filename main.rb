require_relative 'app'
require_relative 'options'
require_relative 'menu_choice'
require_relative 'get_message'

class Main
  def initialize(app)
    @app = app
    @list_options = Option.new
    @execute_action = MenuChoice.new(@app)
    @get_request = GetMessage.new
  end

  def main
    loop do
      @list_options.list_options
      choice = @get_request.get_request('Enter your choice: ', :to_i)

      case choice
      when 1..6
        @execute_action.execute_action(choice)
      when 7
        break
      else
        puts 'Invalid choice, please try again'
      end
    end
  end
end

Main.new(App.new).main
