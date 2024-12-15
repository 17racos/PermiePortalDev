class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name
      t.string :scientific_name
      t.string :family
      t.string :zone, array: true, default: []  # Changed to an array column
      t.boolean :perennial
      t.text :layers, array: true, default: []  # Assuming layers should be an array
      t.text :function, array: true, default: [] # Assuming plant_function should be an array
      t.text :description  # Added missing comma here
      t.text :purpose, array: true, default: []  # Fixed column type definition
      t.text :plant_function, array: true, default: []  # Fixed column type definition
      t.text :companions
      t.text :pests
      t.text :conditions
      t.text :avoid
      t.timestamps
    end
    add_index :plants, :common_name, unique: true
  end
end
