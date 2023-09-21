require 'date'

class Item
  attr_accessor :publish_date, :id, :can_be_archived, :label, :genre, :author

  def initialize(publish_date, archived, id = nil)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def add_label(label)
    @label = label
    @label.add_item(self)
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def can_be_archived?
    current_year = Date.today.year
    publish_year = Date.parse(@publish_date).year
    current_year - publish_year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
