# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ship, type: :model do
  describe 'validatons' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :board }
    it { should have_many :cells }
  end
end

RSpec.describe Ship, type: :model do
  describe 'methods' do
    it '.create_ships()' do
      User.delete_all
      user = User.create!(name: 'Tulu')
      Board.create!(user_id: user.id)
      user2 = User.create!(name: 'COMPUTER')
      Board.create!(user_id: user2.id)
      expect(Ship.all).to be_empty
      game_data = {
        user_name: user.name,
        ships: [{name: 'Lilac', coordinates: ['A1', 'A2']}, {name: 'Dudeness', coordinates: ['B1', 'B2']}],
        player_to_move: 'George',
        board_size: '10X10',
        difficulty: 'easy'
      }
      Ship.create_ships(game_data)
      expect(Ship.all).to_not be_empty
      user_ships = Ship.where(user_id: user.id)
      computer_ships = Ship.where(user_id: user2.id)
      expect(user_ships.count).to eq(2)
      expect(computer_ships.count).to eq(2)
      user_ships.each do |ship|
        expect(ship.board).to eq(user.board)
      end
      computer_ships.each do |ship|
        expect(ship.board).to eq(user2.board)
      end
    end
  end
end
