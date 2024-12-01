class AddCompanionsAndAvoidToPlants < ActiveRecord::Migration[7.0]
  def change
    # Add companions column only if it doesn't exist
    unless column_exists?(:plants, :companions)
      add_column :plants, :companions, :text
    end
  end
end

