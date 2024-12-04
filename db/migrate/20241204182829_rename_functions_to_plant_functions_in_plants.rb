class RenameFunctionsToPlantFunctionsInPlants < ActiveRecord::Migration[7.0]
  def change
    rename_column :plants, :function, :plant_function
  end
end
