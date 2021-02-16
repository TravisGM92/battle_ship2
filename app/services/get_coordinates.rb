class GetCoordinates

  def initialize(data)
    @computer_user = data[:user]
    @ship = data[:ship]
    @board = data[:user].board
    @alpha = ('a'..'z').to_a
  end

  def get_coordinates
    @first_coord = self.get_first_coordinate
    [@first_coord, self.get_next_coordinates]
  end

  def get_first_coordinate
    results = @board.cells.map { |cell| cell.coordinate if cell.state == 'empty' && cell.ship_id.nil? }
    results.shuffle.pop
  end

  def get_next_coordinates
    if @ship.health == 1
      nil
    else
      if self.fits_vert? && self.fits_horz?
        [0..1].shuffle.pop == 0 ? self.get_vertical_coords : self.get_horizontal_coords
      else
        self.fits_vert? ? self.get_vertical_coords : self.get_horizontal_coords
      end
    end
  end

  def fits_vert?
    y = @first_coord[-1].to_i
    (y + @ship.health <= 10) || (y - @ship.health > 0)
  end

  def fits_horz?
    x = @first_coord[0]
    (@alpha.index(x) + @ship.health <= 25) || (@alpha.index(x) - @ship.health > 0)
  end

  def get_vertical_coords
    require "pry"; binding.pry
  end

  def get_horizontal_coords
    if @alpha.index(@first_coord[0]) - @ship.health > 0
      self.get_left_coords(@alpha.index(@first_coord[0]))
    else
      self.get_right_coords(@alpha.index(@first_coord[0]))
    end
  end

  def get_left_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index - 1] + "#{@first_coord[1..-1]}"
      index -= 1
    end
    results
  end

  def get_right_coords(index)
    results = []
    (@ship.health - 1).times do
      results << @alpha[index + 1] + "#{@first_coord[1..-1]}"
      index += 1
    end
    results
  end
end
