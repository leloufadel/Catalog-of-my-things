require 'json'
require 'time' #  line to require the 'time' library

class Game
  attr_accessor :title, :platform, :last_played_at, :author

  def initialize(title, platform)
    @title = title
    @platform = platform
    @last_played_at = Time.now
  end

  def can_be_archived?
    (Time.now - last_played_at) > 2 * 365 * 24 * 60 * 60 # 2 years in seconds
  end

  def to_json(*_args)
    {
      title: @title,
      platform: @platform,
      last_played_at: @last_played_at.to_s
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['title'], data['platform']).tap do |game|
      game.last_played_at = Time.parse(data['last_played_at'])
    end
  end

  def save_to_file(filename)
    File.write(filename, to_json)
  end

  def self.load_from_file(filename)
    data = File.read(filename)
    from_json(data)
  end
end
