class CreatePests < ActiveRecord::Migration[7.2]
  def change
    create_table :pests do |t|
      t.string :name, null: false
      t.string :slug, null: false  # Add slug column
      t.string :picture
      t.string :scientific_name      
      t.text :description
      t.text :characteristics
      t.text :control_methods
      t.text :natural_enemies

      t.timestamps
    end

    # Add a unique index for the `name` and `slug` columns
    add_index :pests, :name, unique: true
    add_index :pests, :slug, unique: true
  end
end