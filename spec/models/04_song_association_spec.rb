require_relative '../spec_helper'

describe 'Song Associations' do
  before do
    @song = Song.create(title: "Forever")
  end

  it 'has a genre' do
    genre = Genre.create(name: "Rock")
    @song.genre = genre
    @song.save

    expect(Song.find_by(title: "Forever").genre).to eq(genre)
  end

  it 'can have an artist' do
    artist = Artist.create(name: "Prince")
    @song.artist = artist
    @song.save

    expect(Song.where(title: "Forever").first.artist).to eq(artist)
  end

  it 'can be created with an artist as an attribute' do
    artist = Artist.create(name: "The Beatles")
    song = Song.create(title: "Yellow Submarine", artist: artist)

    expect(Song.where(title: "Yellow Submarine").first.artist).to eq(artist)
  end

  it 'can build genres' do
    genre = @song.build_genre(name: "Rap")
    @song.save

    expect(Song.where(title: "Forever").first.genre).to eq(genre)
    expect(Genre.where(name: "Rap").first.songs).to include(@song)
  end

end
