class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name
      t.string :scientific_name
      t.string :family
      t.string :zones, array: true, default: []  # Changed to an array column
      t.boolean :perennial
      t.text :layers, array: true, default: []  # Assuming layers should be an array
      t.text :function, array: true, default: [] # Assuming plant_function should be an array

      t.timestamps
    end
  end
end
