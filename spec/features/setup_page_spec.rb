# require 'rails_helper'
#
# RSpec.describe 'Setup game page' do
#   describe 'lets play button' do
#     it 'once clicked redirects to /setup' do
#       visit('/')
#       click_button('Play!')
#       fill_in :user_name, with: 'George'
#       click_button("Let's play")
#       expect(current_path).to eq('/setup')
#       expect(page).to have_content('George')
#     end
#   end
# end
#
# RSpec.describe 'Setup game page' do
#   describe 'page content' do
#     it 'has a form with users name pre-populated' do
#       visit('/')
#       click_button('Play!')
#       fill_in :user_name, with: 'George'
#       click_button("Let's play")
#       expect(current_path).to eq('/setup')
#       expect(page).to have_content('George')
#     end
#   end
# end
#
# RSpec.describe 'Setup game page' do
#   describe 'setup form' do
#     it 'has a form when player puts in # of ships, routes to where user can indicate where to put them' do
#       visit('/')
#       click_button('Play!')
#       fill_in :user_name, with: 'George'
#       click_button("Let's play")
#       expect(current_path).to eq('/setup')
#       fill_in :number_of_ships_form, with: 2
#       find('#comp_diff').find(:xpath, 'option[1]').select_option
#       click_button("Let's place your ships")
#     end
#     # it 'has a form with # of ships, difficulty, and placement of ships' do
#       # visit('/')
#       # click_button('Play!')
#       # fill_in :user_name, with: 'George'
#       # click_button("Let's play")
#       # expect(current_path).to eq('/setup')
#       # fill_in :number_of_ships_form, with: 2
#       # find('#comp_diff').find(:xpath, 'option[1]').select_option
#       # click_button("Let's go!")
#     #   expect(current_path).to eq('/game')
#     # end
#   end
# end
