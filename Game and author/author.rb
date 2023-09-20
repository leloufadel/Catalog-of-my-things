class Author
  attr_accessor :name, :items

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    # Add the input item to the collection of items
    @items << item
    # Set self as a property of the item object
    item.author = self
  end
end
