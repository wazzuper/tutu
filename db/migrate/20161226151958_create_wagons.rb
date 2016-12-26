class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :wagon_type
      t.integer :top_place
      t.integer :bottom_place

      t.timestamps
    end
  end
end
