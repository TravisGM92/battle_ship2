# frozen_string_literal: true

class User < ApplicationRecord
  validates_presence_of :name
  has_one :board
  has_many :ships

  def self.create_players(data, turn)
    turn.users.create!(name: data[:user_name])
    turn.users.create!(name: 'COMPUTER')
  end
end
