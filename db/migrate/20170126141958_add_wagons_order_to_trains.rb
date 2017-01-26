class AddWagonsOrderToTrains < ActiveRecord::Migration[5.0]
  def change
    change_table :trains do |t|
      t.boolean :sort_wagon
    end
  end
end
