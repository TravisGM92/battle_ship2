# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Play game' do
  describe 'Play! button' do
    it 'when clicked opens field for user name input and a button' do
      visit('/')
      click_button('Play!')
      expect(page).to have_css('#user_name')
      expect(page).to have_button('submit-button')
    end
  end
end

RSpec.describe 'Play game page' do
  describe 'lets play button' do
    it 'once clicked redirects to /game' do
      visit('/')
      click_button('Play!')
      fill_in :user_name, with: 'George'
      click_button('submit-button')
      expect(current_path).to eq('/game')
    end
  end
end
