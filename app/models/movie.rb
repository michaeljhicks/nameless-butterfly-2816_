class Movie < ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def actors_ordering
    self.actors.order(:age)
  end

  def actor_avg_age
    self.actors.average(:age)
  end
end
