require 'json'

class Game
  attr_accessor :title, :platform, :last_played_at

  def initialize(title, platform)
    @title = title
    @platform = platform
    @last_played_at = Time.now
  end

  def can_be_archived?
    # Call the parent class's can_be_archived? method
    parent_can_be_archived = super

    # Check if last_played_at is older than 2 years
    last_played_threshold = Time.now - 2 * 365 * 24 * 60 * 60 # 2 years in seconds

    # Return true only if both conditions are met
    parent_can_be_archived && (last_played_at < last_played_threshold)
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
end
