class User < ActiveRecord::Base

  has_many :users_teams
  has_many :teams, through: :users_teams
end
