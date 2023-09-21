require_relative 'music_album'
require_relative 'genre_module'

module MusicAlbumModule
  include GenreModule

  def list_all_music_albums(music_albums)
    puts 'Music Albums: '
    music_albums.each_with_index do |a, i|
      puts "#{i + 1}> Id:#{a.id}, Genre:#{a.genre.name}, Publish-Date:#{a.publish_date}, On-Spotify: #{a.on_spotify} "
    end
    puts 'No Albums found' if music_albums.empty?
  end

  def add_music_album(genres)
    print 'Publish Date [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'Is it on Spotify [Y/N]: '
    on_spotify = gets.chomp
    on_spotify = on_spotify.downcase != 'n'
    puts 'Select a genre from the following list by number'
    list_all_genres(genres)
    genre = gets.chomp.to_i
    if genre < genres.length
      music_album = MusicAlbum.new(publish_date, false, on_spotify)
      music_album.add_genre(genres[genre.to_i])
      puts 'Music album created successfully'
      music_album
    else
      puts 'Please enter a valid genre num'
    end
  end
end
