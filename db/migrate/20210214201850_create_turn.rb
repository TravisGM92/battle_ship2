class CreateTurn < ActiveRecord::Migration[5.2]
  def change
    create_table :turns do |t|
      t.integer :turn_number
      t.string :player_to_move
    end
  end
end
