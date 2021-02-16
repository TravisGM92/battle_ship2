# frozen_string_literal: true

class Ship < ApplicationRecord
  validates_presence_of :name, :health
  belongs_to :user
  belongs_to :board
  has_many :cells

  def self.create_ships(data)
    data[:ships].each do |ship|
      Ship.create!(name: ship[:name], health: ship[:coordinates].length,
                   user_id: User.find_by(name: data[:user_name]).id, board_id: User.find_by(name: data[:user_name]).board.id)
    end
    create_computer_ships(data[:ships].length)
  end

  def self.create_computer_ships(number_of_ships)
    options = (1..5).to_a.shuffle
    number_of_ships.times do
      Ship.create!(name: Faker::Name.first_name, health: options.pop,
                   board_id: User.find_by(name: 'COMPUTER').board.id, user_id: User.find_by(name: 'COMPUTER').id)
    end
  end
end
