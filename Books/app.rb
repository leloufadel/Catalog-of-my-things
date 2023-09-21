# rubocop:disable all
require_relative 'classes/book/book'
require_relative 'classes/book/label'
require_relative 'modules/modules'

class App
  attr_accessor :books, :label

  include Modules

  def initialize
    @books = []
    @label = []
    load_collections
  end

  def run
    loop do
      puts 'Options:'
      puts '1. List all books'
      puts '2. Add a book'
      puts '3. List labels'
      puts '4. Quit'
      print 'Choose an option: '
      choice = take_input
      case choice
      when 1
        display_books
      when 2
        add_book
      when 3
        display_labels
      when 4
        save_and_exit
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  def save_and_exit
    save_collections
    exit
  end

  def take_input
    print 'Enter a number: '
    option = gets.chomp.to_i
    while option.nil? || option < 1 || option > 4
      puts 'Please enter a number!'
      print 'Enter a number: '
      option = gets.chomp.to_i
    end
    option
  end
end

# Create an instance of the App class and run the application
app = App.new
app.run
# rubocop:enable all
