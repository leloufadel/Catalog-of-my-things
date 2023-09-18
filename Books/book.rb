require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :label_id

  def initialize(publisher, cover_state, publish_date, label_id = nil)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @label_id = label_id
  end

  
end
