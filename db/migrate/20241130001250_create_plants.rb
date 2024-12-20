class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name, null: false
      t.string :scientific_name
      t.string :family
      t.integer :zone, array: true, default: []
      t.boolean :perennial
      t.text :layers, array: true, default: []
      t.text :plant_function, array: true, default: []
      t.text :description  # Store formatted text in this column
      t.text :purpose
      t.text :grow_conditions
      t.text :avoid, array: true, default: []
      t.text :pests, array: true, default: []
      t.text :companions, array: true, default: []

      t.timestamps
    end

    add_index :plants, :common_name, unique: true
  end
end
