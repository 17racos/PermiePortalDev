class AddFunctionsToPlants < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:plants, :functions)
      add_column :plants, :functions, :string, array: true, default: []
    end
    unless column_exists?(:plants, :layers)
      add_column :plants, :layers, :string, array: true, default: []
    end
  end
end

