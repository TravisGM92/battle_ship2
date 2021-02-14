# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'About page' do
  it 'has content introducing Travis and explaining project' do
    visit('/about')
    expect(page).to have_content("That's me")
    expect(page).to have_content('This game is a project I challenged myself')
    expect(page).to have_content('with in order to learn frontend programming')
    expect(page).to have_css('#gh-page')
  end
end
