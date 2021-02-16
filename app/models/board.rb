# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :cells
  has_many :ships
  belongs_to :user

  def self.create_boards(players_data)
    Board.create!(user_id: User.find_by(name: players_data[:user_name]).id)
    Board.create!(user_id: User.find_by(name: 'COMPUTER').id)
  end

  def self.place_human_ships(data)
    data[:ships].each do |ship|
      the_ship = Ship.find_by(name: ship[:name])
      ship[:coordinates].each do |coord|
        the_ship.cells.create!(coordinate: coord.downcase, board_id: User.find_by(name: data[:user_name]).board.id, state: 'ship')
        cell = Cell.find_by(coordinate: coord.downcase)
        cell.state = 'ship'
        cell.ship_id = the_ship.id
      end
    end
  end

  def self.place_computer_ships
    PlaceShips.find_coordinates_for_ships
  end

  def self.create_ships(human_board, computer_board, human_ships)
    Ship.create_ships({
      human_board: human_board,
      computer_board: computer_board,
      human_ships: human_ships
      })
  end
end
