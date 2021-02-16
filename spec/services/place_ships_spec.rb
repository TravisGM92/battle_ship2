# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PlaceShips', type: :model do
  describe 'methods' do
    before(:each) do
      user = User.create!(name: 'COMPUTER')
      board = Board.create!(user_id: user.id)
      3.times do |i|
        board.cells.create!(coordinate: "a#{i + 1}")
      end
      ship = user.ships.create!(name: 'Lila', health: 3, board_id: user.board.id)
      @data = {
        coords: %w[a1 a2 a3],
        ship: ship,
        user: user
      }
    end
    it '.assign_coordinates' do
      cells = Cell.where(state: 'ship')
      expect(PlaceShips.assign_coordinates(@data)).to be_an(Array)
      expect(Cell.where(state: 'ship').count).to eq(3)
      cells.each do |cell|
        expect(cell.coordinate == 'a1' || cell.coordinate == 'a2' || cell.coordinate == 'a3').to eq(true)
        expect(cell.board_id).to eq(@data[:user].board.id)
        expect(cell.ship_id).to eq(@data[:ship].id)
      end
    end

    it '.find_coordinates_for_ships' do
      size = '10X10'
      result = PlaceShips.find_coordinates_for_ships(size)
      expect(result).to be_an(Array)
      expect(result[0].cells.count).to eq(3)
      result[0].cells.each do |cell|
        expect(cell.state).to eq('ship')
        expect(cell.board_id).to eq(@data[:user].board.id)
        expect(cell.ship_id).to eq(@data[:ship].id)
      end
    end
  end
end
