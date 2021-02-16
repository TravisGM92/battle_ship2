require 'rails_helper'

RSpec.describe GetCoordinates, type: :model do
  describe 'methods' do
    before(:each) do
      @range = (1..10).to_a
      user = User.create!(name: 'George')
      board = Board.create!(user_id: user.id)
      @data = {
        user: user,
        ship: Ship.create!(name: 'Lila', user_id: user.id, board_id: board.id, health: 3)
      }
      letters = ('a'..'z').to_a
      letters.each do |letter|
        @range.each do |number|
          Cell.create!(coordinate: "#{letter}#{number}", board_id: board.id)
        end
      end
      @gc = GetCoordinates.new(@data)
    end
    it 'initialize' do
      expect(@gc).to be_a(GetCoordinates)
    end
    # it '.get_coordiantes' do
    #   gc = GetCoordinates.new(@data)
    #   coords = gc.get_coordinates
    #   expect(coords).to be_an(Array)
    #   coords.flatten.compact.each do |coord|
    #     expect(coord).to be_a(String)
    #   end
      # letters = coords.flatten.compact.map { |coord| coord[0] }.sort
      # letters[0..-2].each_with_index do |letter, index|
      #   expect(letters[index+1]).to eq(letter.next)
      # end
      it '.get_first_coordinate' do
        result = @gc.get_first_coordinate
        expect(result).to be_a(String)
        expect(('a'..'z').to_a.include?(result[0])).to eq(true)
        expect(@range.include?(result[1..-1].to_i)).to eq(true)
    end
    it '.fits_vert?' do
      @gc.get_coordinates
      expect(@gc.fits_vert?).to be_in([true, false])
    end
    it '.fits_horz?' do
      @gc.get_coordinates
      expect(@gc.fits_horz?).to be_in([true, false])
    end
    it '.get_left_coords()' do
      @gc.get_coordinates
      result = @gc.get_left_coords(@gc.alpha.index(@gc.first_coord[0]))
      result.each do |coord|
        expect(coord).to be_a(String)
      end
      x = result.map { |coord| coord[0] }.sort

      x.each_with_index do |coord, index|
        @gc.alpha.each_with_index do |letter, index2|
          break if x[index+1].nil?
          if coord == letter
            expect(x[index+1]).to eq(@gc.alpha[index2+1])
          end
        end
      end
    end
    it '.get_right_coords()' do

    end
    it '.get_horizontal_coords' do

    end
  end
end
