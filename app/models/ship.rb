class Ship < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  belongs_to :board
  has_many :cells, through: :board
end
