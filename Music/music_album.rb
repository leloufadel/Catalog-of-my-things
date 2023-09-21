require_relative '../item'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(publish_date, archived, on_spotify, id: nil)
    super(publish_date, archived, id: id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && on_spotify
  end

  def self.path
    'json/music_album.json'
  end

  def self.write_file(data = [])
    music_store = []
    data.each do |d|
      music_store << {
        id: d.id,
        publish_date: d.publish_date,
        archived: d.archived,
        on_spotify: d.on_spotify,
        genre_id: d.genre.id
      }
    end
    File.write(MusicAlbum.path, JSON.generate(music_store))
  end

  def self.read_file(genres)
    music_store = []
    if MusicAlbum.check_file
      JSON.parse(File.read(MusicAlbum.path)).each do |element|
        genre = genres.select { |g| g.id == element['genre_id'] }[0]
        music_album = MusicAlbum.new(element['publish_date'],
                                     element['archived'],
                                     element['on_spotify'],
                                     id: element['id'])
        music_album.add_genre(genre)
        music_store << music_album
      end
    end
    music_store
  end

  def self.check_file
    File.exist?(MusicAlbum.path)
  end
end
