class Cell < ApplicationRecord
  validates_presence_of :coordinate
  belongs_to :board
end
