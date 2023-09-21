require_relative '../Data/game' # Adjust the path as needed
require 'json'

class GameApp
  def initialize
    @games = load_games_from_file
  end

  def list_games
    if @games.empty?
      puts 'No games available.'
    else
      puts 'List of Games:'
      @games.each_with_index do |game, index|
        puts "#{index + 1}. #{game.title} (Platform: #{game.platform})"
      end
    end
  end

  def add_game
    print 'Enter game title: '
    title = gets.chomp
    print 'Enter game platform: '
    platform = gets.chomp
    game = Game.new(title, platform)
    @games << game
    puts "#{title} (Platform: #{platform}) added to the game list."
  end

  def save_to_file
    print 'Enter a filename to save the game data: '
    filename = gets.chomp
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(@games.map(&:to_json))
    end
    puts "Game data saved to #{filename}."
  end

  def load_games_from_file
    filename = 'games.json'
    if File.exist?(filename)
      json_data = File.read(filename)
      game_data = JSON.parse(json_data)
      game_data.map { |game| Game.from_json(game) }
    else
      []
    end
  end
end
