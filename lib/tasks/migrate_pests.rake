namespace :db do
    desc "Migrate pests from plants table to pests table"
    task migrate_pests: :environment do
      puts "Starting migration of pests..."
  
      # Loop through each plant
      Plant.find_each do |plant|
        # Process each pest in the plant's pests array
        plant.pests.each do |pest_name|
          # Find or create the pest in the pests table
          pest = Pest.find_or_create_by!(name: pest_name)
  
          # Create an association in the join table (PlantPest)
          PlantPest.find_or_create_by!(plant: plant, pest: pest)
        end
      end
  
      puts "Migration of pests completed successfully!"
    end
  end
  