class User < ApplicationRecord
    has_many :teams, dependent: :destroy
    has_many :team_superheros, through: :teams
    has_many :superheros, through: :team_superheros

    validates :first_name,
              :last_name,
              :email,
              :age, presence: true   
end
