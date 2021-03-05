# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a home page with styled content' do
    visit('/')
    expect(page).to have_content("Time to play\n")
    expect(page).to have_content("BattleShip!\n")
    expect(page).to have_button('Play!')
    expect(page).to have_button('Da Rulez')
    expect(page).to have_link('About')
    expect(page).to have_css('#army-tank-gif')
  end
  it 'has about link that redirects to about page' do
    visit('/')
    click_link('About')
    expect(current_path).to eq('/about')
  end
end

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

RSpec.describe 'Play game button' do
  it 'there is a label for number of ships' do
    visit('/')
    click_button('Play!')
    expect(page).to have_content('How many ships?')
  end
  it 'when number of ships is indicated and Lets play button is hit, user is redirected to game page' do

  end
end
