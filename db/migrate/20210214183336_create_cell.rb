class CreateCell < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.string :coordinate
    end
  end
end
