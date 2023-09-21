require_relative '../Music/music_album'

describe 'Testing MusicAlbum Class' do
  before :each do
    @album1 = MusicAlbum.new('2017-03-30', false, true)
    @album2 = MusicAlbum.new('1997-11-22', false, false)
  end

  it 'validate album ID' do
    expect(@album1.id).to be_an(Integer)
  end

  it 'validate music album publish date' do
    expect(Date.parse(@album1.publish_date).year).to eq 2017
    expect(Date.parse(@album1.publish_date).month).to eq 3
    expect(Date.parse(@album2.publish_date).day).to eq 22
  end

  it 'validate if the music album is on spotify' do
    expect(@album1.on_spotify).to eq true
    expect(@album2.on_spotify).to eq false
  end

  it 'validate @album1 and @album2 is an instance object of MusicAlbum' do
    expect(@album1).to be_an_instance_of(MusicAlbum)
    expect(@album2).to be_an_instance_of(MusicAlbum)
  end

  it 'validate can_be_archived? method' do
    expect(@album2.can_be_archived?).to eq false
  end
end
