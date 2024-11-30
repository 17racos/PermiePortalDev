class AddPurposeToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :purpose, :text
  end
end
