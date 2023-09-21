# rubocop:disable all
require_relative 'Books/classes/book/book'
require_relative 'Books/classes/book/label'
require_relative 'Books/modules/modules'
require_relative 'Game_and_author/class/game_app'

class App
  attr_accessor :books, :label

  include Modules
  GameApp = GameApp.new

  def initialize
    @books = []
    @label = []
    load_collections
  end

  def run
    loop do
      puts "\n"
      puts 'Options:'
      puts '1. List all books'
      puts '2. List labels'
      puts '3. List all music albums'
      puts '4. List all genres'
      puts '5. List Games'
      puts '6. Add a book'
      puts '7. Add a music album'
      puts '8. Add a Game'
      puts '9. Save Games to File [type -> games.json]'
      puts '10. Quit'
      print 'Choose an option: '
      choice = take_input
      case choice
      when 1
        display_books
      when 2
        display_labels
      when 3
        add_book
      when 4
        GameApp.list_games
      when 5
        GameApp.add_game
      when 6
        GameApp.save_to_file
      when 7
        save_and_exit
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

# rubocop:enable all

  def save_and_exit
    save_collections
    puts 'Thank you for using this App!'
    exit
  end

  def take_input
    option = gets.chomp.to_i
    while option.nil? || option < 1 || option > 7
      puts 'Please enter a number!'
      option = gets.chomp.to_i
    end
    option
  end
end
