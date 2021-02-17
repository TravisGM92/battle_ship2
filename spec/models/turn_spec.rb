# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Turn, type: :model do
  describe 'validations' do
    it { should validate_presence_of :turn_number }
    it { should validate_presence_of :player_to_move }
  end
  describe 'relationships' do
    it { should have_many :users }
    it { should belong_to :game }
  end
end
