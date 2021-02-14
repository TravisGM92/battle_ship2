# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cell, type: :model do
  describe 'validations' do
    it { should validate_presence_of :coordinate }
  end
  describe 'relationships' do
    it { should belong_to :board }
  end

  describe 'attributes' do
    it 'cell has specific attributes' do
      user = User.create!(name: 'George')
      board = Board.create!(user_id: user.id)
      cell = board.cells.create!(coordinate: 'A1')
      expect(cell.state).to eq('empty')
      expect(cell.board_id).to eq(board.id)
      expect(cell.ship_id).to be_nil
    end
  end
end
