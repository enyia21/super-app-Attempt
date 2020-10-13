class Superhero < ApplicationRecord
    has_many :team_superheros
    has_many :teams, through: :team_superheros
    has_many :users, through: :teams

    validates :name,
              :gender,
              :publisher,
              :power_level, presence: true  
end
