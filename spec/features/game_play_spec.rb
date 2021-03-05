# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Play game' do
  describe 'Play! button' do
    it 'when clicked opens field for user name input and a button' do
      visit('/')
      click_button('Play!')
      expect(page).to have_css('#how_many_ships')
      expect(page).to have_button("Let's play")
    end
  end
end
