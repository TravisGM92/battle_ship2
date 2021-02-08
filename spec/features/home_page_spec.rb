require 'rails_helper'

RSpec.describe 'Home page' do
  it 'Has a home page with styled content' do
    visit('/')
    expect(page).to have_content('Time to Play Battle Ship')
  end
end
