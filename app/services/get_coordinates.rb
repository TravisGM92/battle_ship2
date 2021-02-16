# frozen_string_literal: true

class GetCoordinates
  attr_accessor :first_coord
  attr_reader :alpha, :ship
  attr_writer :first_coord, :board_size

  def initialize(data)
    @computer_user = data[:user]
    @ship = data[:ship]
    @board = data[:user].board
    @alpha = ('a'..'z').to_a
    @board_size = data[:board_size]
  end

  def get_coordinates
    @first_coord = get_first_coordinate
    [@first_coord, get_next_coordinates]
  end

  def get_first_coordinate
    results = @board.cells.map { |cell| cell.coordinate if cell.state == 'empty' && cell.ship_id.nil? }
    results.shuffle.pop
  end

  def get_next_coordinates
    if @ship.health == 1
      nil
    elsif fits_vert? && fits_horz?
      [0..1].shuffle.pop == 0 ? get_vertical_coords : get_horizontal_coords
    else
      fits_vert? ? get_vertical_coords : get_horizontal_coords
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

  def get_vertical_coords
    if (@first_coord[1..-1].to_i - @ship.health).negative?
      get_upper_coords
    else
      get_lower_coords
    end
  end

  def get_upper_coords
    results = []
    index = @first_coord[1..-1].to_i
    (@ship.health - 1).times do
      results << (@first_coord[0]).to_s + (index + 1).to_s
      index += 1
    end
    results
  end

  def get_lower_coords
    results = []
    index = @first_coord[1..-1].to_i
    (@ship.health - 1).times do
      results << (@first_coord[0]).to_s + (index - 1).to_s
      index -= 1
    end
    results
  end

  def get_horizontal_coords
    if (@alpha.index(@first_coord[0]) - @ship.health).positive?
      get_left_coords(@alpha.index(@first_coord[0]))
    else
      get_right_coords(@alpha.index(@first_coord[0]))
    end
  end

  def get_left_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index - 1] + (@first_coord[1..-1]).to_s
      index -= 1
    end
    results
  end

  def get_right_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index + 1] + (@first_coord[1..-1]).to_s
      index += 1
    end
    results
  end
end
