class CreatePlantPests < ActiveRecord::Migration[7.2]
  def change
    create_table :plant_pests do |t|
      t.references :plant, null: false, foreign_key: true
      t.references :pest, null: false, foreign_key: true

      t.timestamps
    end
    add_index :plant_pests, [:plant_id, :pest_id], unique: true
  end
end
