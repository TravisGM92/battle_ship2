require 'rails_helper'

RSpec.describe 'Setup game page' do
  describe 'lets play button' do
    it 'once clicked redirects to /setup' do
      visit('/')
      click_button('Play!')
      fill_in :user_name, with: 'George'
      click_button("Let's play")
      expect(current_path).to eq('/setup')
      expect(page).to have_content('George')
    end
  end
end

RSpec.describe 'Setup game page' do
  describe 'page content' do
    it 'has a form with users name pre-populated' do
      visit('/')
      click_button('Play!')
      fill_in :user_name, with: 'George'
      click_button("Let's play")
      expect(current_path).to eq('/setup')
      expect(find_field('You').value).to eq('George')
    end
    it 'has a form with # of ships, difficulty, and placement of ships' do
      
    end
  end
end