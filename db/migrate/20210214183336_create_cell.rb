class CreateCell < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.string :coordinate
      t.string :state, :default => "empty"
    end
  end
end
