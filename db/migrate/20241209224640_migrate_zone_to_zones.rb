class MigrateZoneToZones < ActiveRecord::Migration[7.0]
  def up
    # Iterate over all the plants and migrate the 'zone' column data to 'zones' array column
    Plant.find_each do |plant|
      if plant.zone.present?
        plant.update_column(:zones, [plant.zone]) # Update the zones array column
      end
    end
  end

  def down
    # If you ever need to roll back, you can remove the zones column
    remove_column :plants, :zones if column_exists?(:plants, :zones)
  end
end

