# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end
  describe 'relationships' do
    it { should have_one :board }
    it { should have_many :ships }
  end
end

RSpec.describe User, type: :model do
  describe 'can have a board' do
    before(:each) do
      @user = User.create!(name: 'George')
    end
    it 'after being created can have a board' do
      board = Board.create!(user_id: @user.id)
      expect(@user).to be_an(User)
      expect(board).to be_a(Board)
      expect(@user.board.id).to eq(board.id)
      expect(board.user_id).to eq(@user.id)
    end
    it 'board can have ships that belong to user' do
      board = Board.create!(user_id: @user.id)
      ship1 = Ship.create!(user_id: @user.id, board_id: board.id, name: 'Twayla', health: 3)
      expect(ship1).to be_a(Ship)
      expect(ship1.user_id).to eq(@user.id)
      expect(ship1.board_id).to eq(board.id)
    end
    it 'ship can have cells' do
      board = Board.create!(user_id: @user.id)
      3.times do |i|
        board.cells.create!(coordinate: "A#{i + 1}")
      end
      ship1 = Ship.create!(user_id: @user.id, board_id: board.id, name: 'Twayla', health: 3)
      ship1.cells.create!(board_id: board.id, coordinate: 'A1')
      ship1.cells.create!(board_id: board.id, coordinate: 'A2')
      ship1.cells.create!(board_id: board.id, coordinate: 'A3')
      expect(ship1.cells.length).to eq(3)
      ship1.cells.each do |cell|
        expect(cell.board_id).to eq(board.id)
      end
    end
  end
end
