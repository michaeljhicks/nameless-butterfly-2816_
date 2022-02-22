require 'rails_helper'

RSpec.describe 'Movies Show Page' do
  it "can show a movie's attributes and list actors from youngest to olders, and show average age of actors" do
    paramount = Studio.create!(name: "Paramount Studios", location: "Hollywood, CA")
    mission = paramount.movies.create!(title: 'Mission Impossible', creation_year: 1996, genre: 'Action/Adventure')
    # firm = Movie.create!(title: 'The Firm', creation_year: 1993, genre: 'Thriller')
    # happy = Movie.create!(title: 'Happy Gilmore', creation_year: 1996, genre: 'Comedy')

    cruise = mission.actors.create!(name: "Tom Cruise", age: 60)
    rhames = mission.actors.create!(name: "Ving Rhames", age: 50)
    # sandler = happy.actors.create!(name: "Adam Sandler", age: 50)

    visit "/movies/#{mission.id}"
    # save_and_open_page

    expect(page).to have_content(mission.title)
    expect(page).to have_content(mission.creation_year)
    expect(page).to have_content(mission.genre)
    expect(page).to have_content(cruise.name)
    expect(page).to have_content(cruise.age)
    expect(rhames.name).to appear_before(cruise.name)
    expect(page).to have_content(mission.actor_avg_age)
  end


end
