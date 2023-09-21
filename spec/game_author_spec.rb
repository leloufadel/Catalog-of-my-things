require 'json'
require 'minitest'
require_relative '../Game_and_author/Data/game' # Include the Game class
require_relative '../Game_and_author/Data/author' # Include the Author class

RSpec.describe Game do
  let(:game_data) { { 'title' => 'Sample Game', 'platform' => 'Xbox', 'last_played_at' => Time.now.to_s } }

  it 'can be created from JSON' do
    game_json = game_data.to_json
    game = Game.from_json(game_json)
    expect(game.title).to eq(game_data['title'])
    expect(game.platform).to eq(game_data['platform'])
    expect(game.last_played_at.to_s).to eq(game_data['last_played_at'])
  end

  it 'can be saved and loaded from a file' do
    filename = 'game.json'
    game = Game.new('Sample Game', 'Xbox')
    game.save_to_file(filename)

    loaded_game = Game.load_from_file(filename)
    expect(loaded_game.title).to eq(game.title)
    expect(loaded_game.platform).to eq(game.platform)
    expect(loaded_game.last_played_at.to_s).to eq(game.last_played_at.to_s)

    File.delete(filename) # Clean up the test file
  end
end

RSpec.describe Author do
  let(:author_data) { { 'name' => 'John Doe', 'items' => [] } }

  it 'can be created from JSON' do
    author_json = author_data.to_json
    author = Author.from_json(author_json)
    expect(author.name).to eq(author_data['name'])
    expect(author.items).to be_empty
  end

  it 'can add items to an author' do
    author = Author.new('John Doe')
    game = Game.new('Sample Game', 'Xbox')
    author.add_item(game)
    expect(author.items).to include(game)
    expect(game.author).to eq(author)
  end

  it 'can be saved and loaded from a file' do
    filename = 'author.json'
    author = Author.new('John Doe')
    author.save_to_file(filename)

    loaded_author = Author.load_from_file(filename)
    expect(loaded_author.name).to eq(author.name)
    expect(loaded_author.items).to be_empty

    File.delete(filename) # Clean up the test file
  end
end
