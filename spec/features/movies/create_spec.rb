require 'rails_helper'

RSpec.describe 'Movie Create/Update Page' do
  it "can show a link to a form to add an actor to movie" do
    paramount = Studio.create!(name: "Paramount Studios", location: "Hollywood, CA")
    mission = paramount.movies.create!(title: 'Mission Impossible', creation_year: 1996, genre: 'Action/Adventure')
    cruise = mission.actors.create!(name: "Tom Cruise", age: 60)
    rhames = mission.actors.create!(name: "Ving Rhames", age: 50)
    # firm = Movie.create!(title: 'The Firm', creation_year: 1993, genre: 'Thriller')
    # happy = Movie.create!(title: 'Happy Gilmore', creation_year: 1996, genre: 'Comedy')
    # sandler = happy.actors.create!(name: "Adam Sandler", age: 50)

    visit "/movies/#{mission.id}"
    expect(page).to have_link("Add Actor")
    click_link("Add Actor")
    fill_in 'name', with: 'Jon Voight'
    fill_in 'age', with: 68

    click_on "Create"
    voight = mission.actors.create!(name: "John Voight", age: 68)

    expect(current_path).to eq("/movies/#{mission.id}")
    expect(page).to have_content(voight.name)
    expect(page).to have_content(voight.age)



  end

end
