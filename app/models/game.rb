class Game < ApplicationRecord
  has_many :turns
  has_many :users, through: :turns

  def create_turns(data)
    turn = self.turns.create!(turn_number: 0, player_to_move: data[:player_to_move])
    create_game(data, turn)
  end

  def create_game(data, turn)
    User.create_players(data, turn)
    Board.create_boards(data)
    Ship.create_ships(data)
    Cell.create_cells(data[:board_size], data[:user_name])
    Board.place_human_ships(data)
    Board.place_computer_ships
  end
end
