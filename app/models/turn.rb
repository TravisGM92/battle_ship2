# frozen_string_literal: true

class Turn < ApplicationRecord
  has_many :users
  belongs_to :game
  validates_presence_of :turn_number, :player_to_move
end
