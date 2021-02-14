class User < ApplicationRecord
  validates_presence_of :name
  has_one :board
  has_many :ships
end
