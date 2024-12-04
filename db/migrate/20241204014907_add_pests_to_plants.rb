class AddPestsToPlants < ActiveRecord::Migration[6.0]
    def change
    unless column_exists?(:plants, :pests)
      add_column :plants, :pests, :text
    end
  end
end

