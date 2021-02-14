require 'rails_helper'

RSpec.describe Cell, type: :model do
  describe 'validations' do
    it { should validate_presence_of :coordinate }
  end
  describe 'relationships' do
    it { should belong_to :board }
  end
end
