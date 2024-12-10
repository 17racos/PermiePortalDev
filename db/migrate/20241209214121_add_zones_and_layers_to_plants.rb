class AddZonesAndLayersToPlants < ActiveRecord::Migration[7.0]
  def change
    # Alter 'layers' to be an array column (if not already array)
    if column_exists?(:plants, :layers)
      # If 'layers' is not already an array, this will cast it into a varchar[] array type
      execute "ALTER TABLE plants ALTER COLUMN layers TYPE varchar[] USING layers::varchar[]"
    else
      add_column :plants, :layers, :string, array: true, default: []
    end

    # Alter 'zones' to be an array column (if not already array)
    if column_exists?(:plants, :zones)
      # If 'zones' is not already an array, this will cast it into a varchar[] array type
      execute "ALTER TABLE plants ALTER COLUMN zones TYPE varchar[] USING zones::varchar[]"
    else
      add_column :plants, :zones, :string, array: true, default: []
    end
  end
end
