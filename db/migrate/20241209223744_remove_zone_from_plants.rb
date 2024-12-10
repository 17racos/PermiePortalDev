class RemoveZoneFromPlants < ActiveRecord::Migration[7.0]
  def change
    remove_column :plants, :zone, :string if column_exists?(:plants, :zone)
  end
end

