require 'rails_helper'

RSpec.describe 'Play game' do
  describe 'Play! button' do
    it 'when clicked redirects to game play screen' do
      visit('/')
      click_button('Play!')
      expect(current_path).to eq('/play')
    end
  end
end
