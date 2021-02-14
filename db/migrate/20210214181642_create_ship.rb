class CreateShip < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :name
    end
  end
end
