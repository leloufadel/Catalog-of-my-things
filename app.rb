require_relative './Game_and_author/game' # Adjust the path as needed
require 'json'

class GameApp
  def initialize
    @games = load_games_from_file
  end

  def main_menu
    puts "Welcome to the Game App!"
    loop do
      puts "\nMain Menu:"
      puts "1. List Games"
      puts "2. Add a Game"
      puts "3. Save Games to File"
      puts "4. Exit"
      print "Enter your choice: "
      choice = gets.chomp.to_i
      case choice
      when 1
        list_games
      when 2
        add_game
      when 3
        save_to_file
      when 4
        exit_program
      else
        puts "Invalid choice. Please choose a valid option."
      end
    end
  end

  def list_games
    if @games.empty?
      puts "No games available."
    else
      puts "List of Games:"
      @games.each_with_index do |game, index|
        puts "#{index + 1}. #{game.title} (Platform: #{game.platform})"
      end
    end
  end

  def add_game
    print "Enter game title: "
    title = gets.chomp
    print "Enter game platform: "
    platform = gets.chomp
    game = Game.new(title, platform)
    @games << game
    puts "#{title} (Platform: #{platform}) added to the game list."
  end

  def save_to_file
    print "Enter a filename to save the game data: "
    filename = gets.chomp
    File.open(filename, 'w') do |file|
      file.puts JSON.generate(@games.map(&:to_json))
    end
    puts "Game data saved to #{filename}."
  end

  def load_games_from_file
    filename = "games.json"
    if File.exist?(filename)
      json_data = File.read(filename)
      game_data = JSON.parse(json_data)
      game_data.map { |game| Game.from_json(game) }
    else
      []
    end
  end

  def exit_program
    puts "Thank you for using the Game App!"
    save_to_file
    exit
  end
end

# Usage
app = GameApp.new
app.main_menu
