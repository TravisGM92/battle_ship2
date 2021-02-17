# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetCoordinates, type: :model do
  describe 'methods' do
    before(:each) do
      @range = (1..10).to_a
      user = User.create!(name: 'George')
      board = Board.create!(user_id: user.id)
      @data = {
        user: user,
        ship: Ship.create!(name: 'Lila', user_id: user.id, board_id: board.id, health: 3),
        board_size: '10X10'
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

    it '.find_coordinates' do
      gc = GetCoordinates.new(@data)
      coords = gc.find_coordinates
      expect(coords).to be_an(Array)
      coords.flatten.compact.each do |coord|
        expect(coord).to be_a(String)
      end
      coordinates = coords.flatten.compact
      coordinates.each_with_index do |coordinate, index|
        break if coordinates[index + 1].nil?

        if coordinate[0] == coordinates[index + 1][0]
          expect(coordinate[1].to_i).to_not eq(coordinates[index + 1][1])
        else
          expect(coordinate[0]).to_not eq(coordinates[index + 1][0])
        end
      end
    end

    it '.find_first_coordinate' do
      result = @gc.find_first_coordinate
      expect(result).to be_a(String)
      expect(('a'..'z').to_a.include?(result[0])).to eq(true)
      expect(@range.include?(result[1..-1].to_i)).to eq(true)
    end

    it '.fits_vert? with short ship' do
      @gc.first_coord = 'a1'
      expect(@gc.fits_vert?).to eq(true)
    end

    it '.fits_vert? with long ship' do
      user = User.create!(name: 'George2')
      board = Board.create!(user_id: user.id)
      data = {
        user: user,
        ship: Ship.create!(name: 'Lila2', user_id: user.id, board_id: board.id, health: 5),
        board_size: '10X9'
      }
      letters = ('a'..'z').to_a
      letters.each do |letter|
        @range.each do |number|
          Cell.create!(coordinate: "#{letter}#{number}", board_id: board.id)
        end
      end
      gc = GetCoordinates.new(data)
      gc.first_coord = 'a5'
      expect(gc.fits_vert?).to eq(true)
    end

    it '.fits_vert? with long ship expect false' do
      user = User.create!(name: 'George2')
      board = Board.create!(user_id: user.id)
      data = {
        user: user,
        ship: Ship.create!(name: 'Lila2', user_id: user.id, board_id: board.id, health: 5),
        board_size: '10X7'
      }
      letters = ('a'..'z').to_a
      letters.each do |letter|
        @range.each do |number|
          Cell.create!(coordinate: "#{letter}#{number}", board_id: board.id)
        end
      end
      gc = GetCoordinates.new(data)
      gc.first_coord = 'a4'
      expect(gc.fits_vert?).to eq(false)
    end

    it '.fits_horz? with short ship' do
      @gc.first_coord = 'b2'
      expect(@gc.fits_horz?).to eq(true)
    end

    it '.fits_horz? with long ship' do
      user = User.create!(name: 'George3')
      board = Board.create!(user_id: user.id)
      data = {
        user: user,
        ship: Ship.create!(name: 'Lila3', user_id: user.id, board_id: board.id, health: 5),
        board_size: '7X7'
      }
      letters = ('a'..'z').to_a
      letters.each do |letter|
        @range.each do |number|
          Cell.create!(coordinate: "#{letter}#{number}", board_id: board.id)
        end
      end
      gc = GetCoordinates.new(data)
      gc.first_coord = 'd5'
      expect(gc.fits_horz?).to eq(false)
    end

    it '.left_coords()' do
      @gc.find_coordinates
      result = @gc.left_coords(@gc.alpha.index(@gc.first_coord[0]))
      result.each do |coord|
        expect(coord).to be_a(String)
      end
      x = result.map { |coord| coord[0] }.sort

      x.each_with_index do |coord, index|
        @gc.alpha.each_with_index do |letter, index2|
          break if x[index + 1].nil?

          expect(x[index + 1]).to eq(@gc.alpha[index2 + 1]) if coord == letter
        end
      end
    end

    it '.right_coords()' do
      @gc.first_coord = 'a1'
      result = @gc.right_coords(@gc.alpha.index(@gc.first_coord[0]))
      expect(result).to be_an(Array)
      result.each_with_index do |coord, _index|
        expect(coord).to be_a(String)
      end
      expect(result[0][0]).to eq('b')
      expect(result[1][0]).to eq('c')
    end

    it '.horizontal_coords with first_coord - ship.health < 0' do
      @gc.first_coord = 'a1'
      result = @gc.horizontal_coords
      expect(result[0][0]).to eq('b')
    end

    it '.horizontal_coords with first_coord - ship.health > 0' do
      @gc.first_coord = 'e1'
      result = @gc.horizontal_coords
      expect(result[0][0]).to eq('d')
    end

    it '.vertical_coords with .upper_cords' do
      @gc.first_coord = 'a1'
      result = @gc.vertical_coords
      expect(result).to be_an(Array)
      expect(result[0]).to eq('a2')
      expect(result[1]).to eq('a3')
    end

    it '.vertical_coords with .lower_coords' do
      @gc.first_coord = 'a10'
      result = @gc.vertical_coords
      expect(result).to be_an(Array)
      expect(result[0]).to eq('a9')
      expect(result[1]).to eq('a8')
    end

    it '.find_next_coordinates' do
      @gc.first_coord = 'a1'
      result = @gc.find_next_coordinates
      expect(result).to be_an(Array)
    end
  end
end
