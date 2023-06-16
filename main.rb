require_relative 'app'
require_relative 'options'
require_relative 'menu_choice'
require_relative 'get_message'
require_relative 'createjson'

class Main
  def initialize(app)
    @app = app
    @list_options = Option.new
    @cli = GetMessage.new
    @execute_action = MenuChoice.new(@app, @cli)
  end

  def main
    loop do
      @list_options.list_options
      choice = @cli.get_request('Enter your choice: ', :to_i)

      case choice
      when 1..6
        @execute_action.execute_action(choice)
      when 7
        create_json_files
        puts 'Thank you for using this app!'
        break
      else
        puts 'Invalid choice, please try again'
      end
    end
  end

  def create_json_files
    CreateJsonBook.new(@app).create_file
    CreateJsonPeople.new(@app).create_file
    CreateJsonRental.new(@app).create_file
  end
end

Main.new(App.new).main
