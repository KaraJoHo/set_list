require 'rails_helper'

RSpec.describe 'the songs show page' do 
  # As a user, when I visit '/songs/1' (where 1 is the id of a song in my database), 
  # Then I see that song's title and artist
  # And I do not see any of the other songs in my database
  it 'displays the song title' do 
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I really like you", length: 8, play_count: 4) #automatically associates the record it was called on
    song2 = artist.songs.create!(title: "REeeeee", length: 8, play_count: 4)
    # song = Song.create(title: "I really like you", length: 8, play_count: 4)
    visit "/songs/#{song.id}" #loaclhost.3000/songs/1
  

    expect(page).to have_content(song.title)
    expect(page).to have_no_content(song2.title)
  end

  it 'displays the name of the artist for the song' do 
    artist = Artist.create!(name: "Carly Rae Jepsen")
    song = artist.songs.create!(title: "I really like you", length: 8, play_count: 4) #automatically associates the record it was called on
    song2 = artist.songs.create!(title: "REeeeee", length: 8, play_count: 4)

    visit "/songs/#{song.id}" 

    expect(page).to have_content(artist.name)

  end
end
