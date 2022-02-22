require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to :studio }
    it { should have_many(:actors).through(:movie_actors) }
  end
  describe '#actor_avg_age' do
    it "should return the mean age average" do
      paramount = Studio.create!(name: "Paramount Studios", location: "Hollywood, CA")
      mission = paramount.movies.create!(title: 'Mission Impossible', creation_year: 1996, genre: 'Action/Adventure')

      cruise = mission.actors.create!(name: "Tom Cruise", age: 60)
      rhames = mission.actors.create!(name: "Ving Rhames", age: 50)

      expect(mission.actor_avg_age).to eq(55)
    end
  end
end
