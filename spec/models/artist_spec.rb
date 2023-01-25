require 'rails_helper'

RSpec.describe Artist do 
  it {should have_many :songs}

  describe 'instance method' do 
    describe '#average_song_length' do 
      before :each do 
        @prince = Artist.create!(name: "Prince")
        @purple = @prince.songs.create!(title: "Purple Rain", length: 13, play_count: 34)
        @beret = @prince.songs.create!(title: "Raspberry Beret", length: 98, play_count: 94)
      end

      it 'returns average song length' do 
        expect(@prince.average_song_length.round(2)).to eq(55.50)
      end
    end
  end
end