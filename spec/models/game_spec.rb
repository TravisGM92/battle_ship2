require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'relationships' do
    it { should have_many :turns }
    it { should have_many(:users).through(:turns) }
  end
end
