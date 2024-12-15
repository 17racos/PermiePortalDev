class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name, null: false  # Ensure common_name is mandatory
      t.string :scientific_name
      t.string :family
      t.string :zone, array: true, default: []  # Array column for zones
      t.boolean :perennial
      t.text :layers, array: true, default: []  # Array column for layers
      t.text :function, array: true, default: []  # Array column for plant functions
      t.text :description, array: true, default: []  # Array column for plant functions
      t.text :purpose, array: true, default: []  # Array column for purposes
      t.text :plant_function, array: true, default: []  # Array column for plant functions
      t.text :companions
      t.text :pests
      t.text :grow_conditions, array: true, default: []  # Array column for plant functions
      t.text :avoid

      t.timestamps
    end

    # Add a unique index to the common_name column to enforce uniqueness
    add_index :plants, :common_name, unique: true
  end
end
