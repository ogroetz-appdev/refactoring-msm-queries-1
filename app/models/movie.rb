# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  def title_with_year
    return self.title + "(" + self.year.to_s + ")"
  end

  def director
    # one to many
    Director.where({ :id => self.director_id }).at(0)
  end

  def cast
    # many to many
    characters = Character.where({ :movie_id => self.id })
    actors = []
    character.each do |character|
      actors.push(Actor.where({ :id => character.actor_id }).at(0))
    end
    return actors
  end
end
