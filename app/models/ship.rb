# frozen_string_literal: true

class Ship < ApplicationRecord
  validates_presence_of :name, :health
  belongs_to :user
  belongs_to :board
  has_many :cells
end
