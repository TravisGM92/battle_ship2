require 'rails_helper'

RSpec.describe 'Rules button' do
  it 'when clicked redirects to rules page' do
    visit('/')
    click_button('Da Rulez')
    expect(current_path).to eq('/rules')
  end
end
