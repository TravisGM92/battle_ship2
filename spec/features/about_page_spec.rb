require 'rails_helper'

RSpec.describe 'About page' do
  it 'has content introducing Travis and explaining project' do
    visit('/about')
    expect(page).to have_content('Travis')
  end
end
