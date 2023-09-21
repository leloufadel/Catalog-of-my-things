# rubocop:disable all
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
