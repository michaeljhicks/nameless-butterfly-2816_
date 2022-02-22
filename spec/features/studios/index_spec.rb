require 'rails_helper'

RSpec.describe 'Studio Index page' do
  xit "can show each studio's name and location" do
    mgm = Studio.create!(name: 'MGM', location: 'Los Angeles, CA')
    paramount = Studio.create!(name: 'Paramount Studios', location: 'Hollywood, CA')
    universal = Studio.create!(name: 'Universal Studios', location: 'Anaheim, CA')


    mission = Movie.create!(title: 'Mission Impossible', creation_year: 1996, genre: 'Action/Adventure')
    firm = Movie.create!(title: 'The Firm', creation_year: 1993, genre: 'Thriller')
    risky = Movie.create!(title: 'Risky Business', creation_year: 1983, genre: 'Comedy')

  end

  xit "can show the movie titles of all the studio's movies" do

  end

end
