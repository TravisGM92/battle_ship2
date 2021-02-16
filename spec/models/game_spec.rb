require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should have_many :turns }
    it { should have_many(:users).through(:turns) }
  end
end

RSpec.describe Game, type: :model do
  describe 'integration' do
    it 'upon initialization with username and ship placements, creates 2 boards with cells and ships' do
      game_data = {
        user_name: 'George',
        ships: [{name: 'Lilac', coordinates: ['A1', 'A2']}, {name: 'Dudeness', coordinates: ['B1', 'B2']}],
        player_to_move: 'George',
        board_size: '10X10',
        difficulty: 'easy'
      }
      game = Game.create!
      game.create_turns(game_data)
      expect(game).to be_a(Game)
      game.turns.each do |turn|
        expect(turn).to be_a(Turn)
      end
      expect(game.turns.first.player_to_move).to eq(game_data[:player_to_move])
      expect(game.users).to eq(User.all)
      game.users.each do |user|
        expect(user).to be_an(User)
        expect(user.board).to be_a(Board)
      end
      expect(game.users.first.ships.length).to eq(2)
      ship_names = game.users.first.ships.map { |ship| ship.name }
      game_data_names = game_data[:ships].map { |ship| ship[:name] }
      ship_names.each do |name|
        expect(game_data_names.include?(name)).to eq(true)
      end
      Ship.all.each do |ship|
        expect(ship.cells).to_not be_empty
      end
    end
  end
end
