class AddBoardsToCells < ActiveRecord::Migration[5.2]
  def change
    add_reference :cells, :board, foreign_key: true
  end
end
