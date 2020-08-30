class Movie < ApplicationRecord
  belongs_to :director,
  foreign_key: :director_id,
  primary_key: :id,
  class_name: :Actor

  has_many :castings,
  foreign_key: :movie_id,
  primary_key: :id,
  class_name: :Casting

  has_many :actors,
    through: :castings,
    source: :actor
end
