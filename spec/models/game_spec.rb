# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should have_many :turns }
    it { should have_many(:users).through(:turns) }
  end
end

RSpec.describe Game, type: :model do
  describe 'methods' do
    it '.create_turns()' do
      User.delete_all
      game_data = {
        user_name: 'George',
        ships: [{ name: 'Lilac', coordinates: %w[A1 A2] }, { name: 'Dudeness', coordinates: %w[B1 B2] }],
        player_to_move: 'George',
        board_size: '10X10',
        difficulty: 'easy'
      }
      game = Game.create!
      game.create_turns(game_data)
      game.turns.each do |turn|
        expect(turn).to be_a(Turn)
      end
    end
  end
end
