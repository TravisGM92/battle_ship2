# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Board, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should have_many :cells }
    it { should have_many :ships }
  end
end

RSpec.describe Board, type: :model do
  describe 'methods' do
    it '.create_boards()' do
      User.create!(name: 'George')
      User.create!(name: 'COMPUTER')
      data = {
        user_name: 'George'
      }
      expect(Board.all).to be_empty
      Board.create_boards(data)
      expect(Board.all).to_not be_empty
    end
  end
end

RSpec.describe Board, type: :model do
  describe 'methods' do
    it '.place_human_ships()' do
      User.first.delete
      User.first.delete
      user = User.create!(name: 'George')
      Board.create!(user_id: user.id)
      user.ships.create!(name: 'Lila', health: 3, board_id: user.board.id)
      data = {
        user_name: 'George',
        ships: [{ name: 'Lila', coordinates: %w[A1 A2 A3] }],
        player_to_move: 'George',
        board_size: '10X10',
        difficulty: 'easy'
      }
      expect(user.ships.first.cells).to be_empty
      Board.place_human_ships(data)
      expect(user.ships.first.cells).to_not be_empty
    end
  end
end

RSpec.describe Board, type: :model do
  describe 'methods' do
    it '.place_computer_ships()' do
      User.delete_all
      user = User.create!(name: 'COMPUTER')
      board = Board.create!(user_id: user.id)
      3.times do |i|
        board.cells.create!(coordinate: "a#{i + 1}")
      end
      ship = user.ships.create!(name: 'Lila', health: 3, board_id: user.board.id)
      data = { board_size: '10X10' }
      result = Board.place_computer_ships(data)
      expect(result).to be_an(Array)
      result[0].cells.each do |cell|
        expect(cell.state).to eq('ship')
        expect(cell.board_id).to eq(board.id)
        expect(cell.ship_id).to eq(ship.id)
      end
    end
  end
end
