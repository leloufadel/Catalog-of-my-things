# # rubocop:disable all
# require_relative 'Books/classes/book/book'
# require_relative 'Books/classes/book/label'
# require_relative 'Books/modules/modules'
# require_relative 'Music/genre'
# require_relative 'Music/genre_module'
# require_relative 'Music/music_album_module'
# require_relative 'Game_and_author/class/game_app'
# require 'json'

# class App
#   attr_accessor :books, :label

#   include Modules
#   include MusicAlbumModule
#   include GenreModule

#   GameApp = GameApp.new

#   def initialize
#     @books = []
#     @label = []
#     @genres = []
#     @music_albums = MusicAlbum.read_file(@genres)
#     add_genres(@genres)
#     load_collections
#   end

#   def run
#     loop do
#       puts "\n"
#       puts 'Options:'
#       puts '1. List all books'
#       puts '2. List labels'
#       puts '3. List all music albums'
#       puts '4. List all genres'
#       puts '5. List Games'
#       puts '6. Add a book'
#       puts '7. Add a music album'
#       puts '8. Add a Game'
#       puts '9. Save Games to File [type -> games.json]'
#       puts '10. Quit'
#       print 'Choose an option: '
#       choice = take_input
#       case choice
#       when 1
#         display_books
#       when 2
#         display_labels
#       when 3
#         list_all_music_albums(@music_albums)
#       when 4
#         list_all_genres(@genres)
#       when 5
#         GameApp.list_games
#       when 6
#         add_book
#       when 7
#         # @music_albums << add_music_album(@genres)
#       when 8
#         GameApp.add_game
#       when 9
#         GameApp.save_to_file
#       when 10
#         save_and_exit
#       else
#         puts 'Invalid choice. Please try again.'
#       end
#     end
#   end

# # rubocop:enable all

#   def save_and_exit
#     save_collections
#     # MusicAlbum.write_file(@music_albums)
#     puts 'Thank you for using this App!'
#     exit
#   end

#   def take_input
#     option = gets.chomp.to_i
#     while option.nil? || option < 1 || option > 10
#       puts 'Please enter a number!'
#       option = gets.chomp.to_i
#     end
#     option
#   end
# end

require_relative 'Books/classes/book/book'
require_relative 'Books/classes/book/label'
require_relative 'Books/modules/modules'
require_relative 'Music/genre'
require_relative 'Music/genre_module'
require_relative 'Music/music_album_module'
require_relative 'Game_and_author/class/game_app'
require 'json'

class App
  attr_accessor :books, :label

  include MusicAlbumModule
  include GenreModule
  include Modules
  GameApp = GameApp.new

  def initialize
    @genres = []
    add_genres(@genres)
    @music_albums = MusicAlbum.read_file(@genres)
    @books = []
    @label = []
    load_collections
  end

  def operator(user_choice)
    case user_choice
    when 1 then display_books
    when 2 then display_labels
    when 3 then list_all_music_albums(@music_albums)
    when 4 then list_all_genres(@genres)
    when 5 then GameApp.list_games
    when 6 then add_book
    when 7 then @music_albums << add_music_album(@genres)
    when 8 then GameApp.add_game
    when 9 then GameApp.save_to_file
    when 10 then exit_program
    else puts 'Please choose a number between 1-10'
    end
  end

  def exit_program
    puts 'Thank you for using this App!'
    save_collections
    MusicAlbum.write_file(@music_albums)
    exit
  end
end
