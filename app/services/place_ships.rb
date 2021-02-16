class PlaceShips

  def self.find_coordinates_for_ships
    computer = User.find_by(name: 'COMPUTER')
    computer.ships.each do |ship|
      coords = GetCoordinates.new({user: computer, ship: ship})
      assign_coordinates({coords: coords.get_coordinates, ship: ship, user: computer})
    end
  end

  def self.assign_coordinates(data)
    coords = data[:coords].flatten.compact
    coords.each do |coord|
      data[:ship].cells.create!(coordinate: coord, state: 'ship', board_id: data[:user].board.id, ship_id: data[:ship].id)
      Cell.where(board_id: data[:user].board.id, coordinate: coord).each do |cell|
        cell.state = 'ship'
        cell.ship_id = data[:ship].id
      end
    end
  end
end
