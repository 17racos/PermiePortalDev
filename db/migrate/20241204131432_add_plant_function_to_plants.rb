class AddPlantFunctionToPlants < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:plants, :plant_function)
      add_column :plants, :plant_function, :string, array: true, default: []
    end
    unless column_exists?(:plants, :layers)
      add_column :plants, :layers, :string, array: true, default: []
    end
  end
end

