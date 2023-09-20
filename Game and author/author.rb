require 'json'

class Author
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      name: @name,
      items: @items.map(&:to_json)
    }.to_json
  end

  def self.from_json(json)
    data = JSON.parse(json)
    new(data['name']).tap do |author|
      author.items = data['items'].map { |item_data| Game.from_json(item_data) }
    end
  end
end
