require_relative 'genre'

module GenreModule
  def list_all_genres(genres)
    puts 'Genres: '
    genres.each do |genre|
      puts "#{genre.id} - #{genre.name}"
    end
  end

  def add_genres(genres)
    genre_names = %w[Blues Classical Country Funk Instrumental Hip_Hop Jazz Pop Reggae Rock]
    genre_names.each_with_index do |name, index|
      genres << Genre.new(index, name)
    end
  end
end
