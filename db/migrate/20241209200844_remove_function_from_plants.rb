class RemoveFunctionFromPlants < ActiveRecord::Migration[6.0]
  def change
    remove_column :plants, :function, :string, array: true, default: []
  end
end

