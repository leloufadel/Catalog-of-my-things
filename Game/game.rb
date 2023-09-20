class Game
  attr_accessor :title, :platform, :last_played_at

  def initialize(title, platform)
    @title = title
    @platform = platform
    @last_played_at = Time.now
  end

  def can_be_archived?
    # Override the method from the parent class
    (Time.now - last_played_at) > 2 * 365 * 24 * 60 * 60 # 2 years in seconds
  end
end
