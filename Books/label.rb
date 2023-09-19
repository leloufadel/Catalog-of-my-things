# class Label
#   attr_accessor :items, :color, :title, :id

#   def initialize(color, title, id = nil)
#     @id = id || Random.rand(1..1000)
#     @title = title
#     @color = color
#     @items = []
#   end

#   def add_item(item)
#     @items << item
#     item.label = self
#   end
# end

class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title, color, id = Random.rand(1...1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  # Define the add_item
  def add_item(item)
    # Implement the logic to add the item to the collection and set self as a property of the item
    @items << item
    item.label = self
  end
end



