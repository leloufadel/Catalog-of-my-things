require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date, label_id = nil)
    super(publish_date, label_id)
    @publisher = publisher
    @cover_state = cover_state
  end
  
def can_be_archived
  super || (cover_state == "bad")
  
end
def to_hash
  {
    title: @title,
    publisher: @publisher,
    cover_state: @cover_state,
    publish_date: @publish_date,
  }
end
end