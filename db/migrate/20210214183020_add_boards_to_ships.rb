class AddBoardsToShips < ActiveRecord::Migration[5.2]
  def change
    add_reference :ships, :board, foreign_key: true
  end
end
