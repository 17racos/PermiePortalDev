class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name, null: false
      t.string :scientific_name
      t.text :aka, array: true, default: []
      t.string :family
      t.string :zone

      # New temperature fields
      t.string :ideal_temp_min
      t.string :ideal_temp_max
      t.string :min_temp
      t.string :max_temp

      t.boolean :perennial
      t.text :layers, array: true, default: []
      t.text :plant_function, array: true, default: []
      t.text :description  # Store formatted text in this column
      t.text :purpose
      t.text :avoid, array: true, default: []
      t.text :companions, array: true, default: []

      t.timestamps
    end

    add_index :plants, :common_name, unique: true
  end
end
