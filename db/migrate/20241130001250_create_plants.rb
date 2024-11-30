class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string :picture
      t.string :common_name
      t.string :scientific_name
      t.string :family
      t.string :zone
      t.boolean :perennial
      t.text :layers
      t.text :function

      t.timestamps
    end
  end
end
