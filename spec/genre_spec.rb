require_relative '../Music/genre'
require_relative '../item'

describe 'Testing Genre Class' do
  before :each do
    @genre = Genre.new(22, 'Blues')
    @item = Item.new(1997, false)
  end

  it 'validate genre object has an ID' do
    expect(@genre.id).to be_an(Integer)
  end

  it 'validate the genre name is type of string' do
    expect(@genre.name).to be_a(String)
  end

  it 'validate the genre item is type of Array' do
    expect(@genre.items).to be_a(Array)
  end

  it 'validate genre name' do
    expect(@genre.name).to eq 'Blues'
  end

  it 'validate genre id' do
    expect(@genre.id).to eq 22
  end

  it 'validate add_item method' do
    @genre.add_item(@item)
    @genre.add_item(@item)
    @genre.add_item(@item)
    expect(@genre.items.length).to eq 3
  end

  it 'validate @genre is an instance object of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
  end
end
