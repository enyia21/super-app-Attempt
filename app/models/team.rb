class Team < ApplicationRecord
  has_many :team_superheros, dependent: :destroy
  has_many :superheros, through: :team_superheros
  belongs_to :user
  
  validates :name, presence: true

end
