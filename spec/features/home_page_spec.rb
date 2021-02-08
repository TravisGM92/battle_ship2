require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a home page with styled content' do
    visit('/')
    expect(page).to have_content("Time to play\n")
    expect(page).to have_content("BattleShip!\n")
    expect(page).to have_button('Play!')
    expect(page).to have_button('Da Rulez')
    expect(page).to have_link('About')
  end
end
