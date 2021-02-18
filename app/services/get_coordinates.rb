# frozen_string_literal: true

class GetCoordinates
  attr_accessor :first_coord
  attr_reader :alpha, :ship
  attr_writer :board_size

  def initialize(data)
    @computer_user = data[:user]
    @ship = data[:ship]
    @board = data[:user].board
    @alpha = ('a'..'z').to_a
    @board_size = data[:board_size]
  end

  def find_coordinates
    @first_coord = find_first_coordinate
    [@first_coord, find_next_coordinates]
  end

  def find_first_coordinate
    results = @board.cells.map { |cell| cell.coordinate if cell.state == 'empty' && cell.ship_id.nil? }
    results.shuffle.pop
  end

  def find_next_coordinates
    if @ship.health == 1
      nil
    elsif fits_vert? && fits_horz?
      [0..1].shuffle.pop == 0 ? vertical_coords : horizontal_coords
    else
      fits_vert? ? vertical_coords : horizontal_coords
    end
  end

  def fits_vert?
    y = @first_coord[-1].to_i - 1
    (y + @ship.health <= @board_size.split('X')[1].to_i)
  end

  def fits_horz?
    x = @alpha.index(@first_coord[0])
    (x + @ship.health <= @board_size.split('X')[0].to_i)
  end

  def vertical_coords
    if (@first_coord[1..-1].to_i - @ship.health).negative?
      upper_coords
    else
      lower_coords
    end
  end

  def upper_coords
    results = []
    index = @first_coord[1..-1].to_i
    (@ship.health - 1).times do
      results << (@first_coord[0]).to_s + (index + 1).to_s
      index += 1
    end
    results
  end

  def lower_coords
    results = []
    index = @first_coord[1..-1].to_i
    (@ship.health - 1).times do
      results << (@first_coord[0]).to_s + (index - 1).to_s
      index -= 1
    end
    results
  end

  def horizontal_coords
    if (@alpha.index(@first_coord[0]) - @ship.health).positive?
      left_coords(@alpha.index(@first_coord[0]))
    else
      right_coords(@alpha.index(@first_coord[0]))
    end
  end

  def left_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index - 1] + (@first_coord[1..-1]).to_s
      index -= 1
    end
    results
  end

  def right_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index + 1] + (@first_coord[1..-1]).to_s
      index += 1
    end
    results
  end
end
