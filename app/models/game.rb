class Game < ApplicationRecord
  has_many :turns
  has_many :users, through: :turns
end
