require 'rails_helper'

RSpec.describe 'Studio Index page' do
  it "can show each studio's name and location" do
    mgm = Studio.create!(name: 'MGM', location: 'Los Angeles, CA')
    paramount = Studio.create!(name: 'Paramount Studios', location: 'Hollywood, CA')
    universal = Studio.create!(name: 'Universal Studios', location: 'Anaheim, CA')

    visit 'studios'
    save_and_open_page

    expect(page).to have_content('Studios')
    expect(page).to have_content("Name: #{mgm.name}")
    expect(page).to have_content("Location: #{mgm.location}")
    expect(page).to have_content("Name: #{paramount.name}")
    expect(page).to have_content("Location: #{paramount.location}")
    expect(page).to have_content("Name: #{universal.name}")
    expect(page).to have_content("Location: #{universal.location}")
  end

  it "can show the movie titles of all the studio's movies" do
    mgm = Studio.create!(name: 'MGM', location: 'Los Angeles, CA')
    paramount = Studio.create!(name: 'Paramount Studios', location: 'Hollywood, CA')
    universal = Studio.create!(name: 'Universal Studios', location: 'Anaheim, CA')

    mission = mgm.movies.create!(title: 'Mission Impossible', creation_year: 1996, genre: 'Action/Adventure')
    firm = paramount.movies.create!(title: 'The Firm', creation_year: 1993, genre: 'Thriller')
    risky = universal.movies.create!(title: 'Risky Business', creation_year: 1983, genre: 'Comedy')

    visit 'studios'
    expect(page).to have_content(mission.title)
    expect(page).to have_content(firm.title)
    expect(page).to have_content(risky.title)


  end

end
