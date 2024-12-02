class AddConditionsToPlants < ActiveRecord::Migration[7.0]
  def change
    unless column_exists?(:plants, :conditions)
      add_column :plants, :conditions, :text
    end
  end
end

