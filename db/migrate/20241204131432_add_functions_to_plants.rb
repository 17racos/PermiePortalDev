class AddFunctionsToPlants < ActiveRecord::Migration[7.0]
  def change
    add_column :plants, :functions, :string
  end
end
