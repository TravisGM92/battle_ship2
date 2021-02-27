# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :turns
  has_many :users, through: :turns

  def create_turns(data)
    turn = turns.create!(turn_number: 0, player_to_move: data[:player_to_move])
    create_game(data, turn)
  end

  def create_game(data, turn)
    User.create_players(data, turn)
    Board.create_boards(data)
    Ship.create_ships(data)
    Cell.create_cells(data[:board_size])
    Board.place_human_ships(data)
    Board.place_computer_ships(data)
  end

  def self.format_data_to_start(data)
    require "pry"; binding.pry
  end
end
