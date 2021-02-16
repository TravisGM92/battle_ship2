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
