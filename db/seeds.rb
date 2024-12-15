# Helper method to create or update a plant
def create_or_update_plant(attributes)
  # Use case-insensitive lookup for common_name to match the controller logic
  plant = Plant.find_by("(common_name) = ?", attributes[:common_name])
  if plant
    puts "Updating #{attributes[:common_name]}"
    plant.update!(attributes)
  else
    puts "Creating #{attributes[:common_name]}"
    Plant.create!(attributes)
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to seed #{attributes[:common_name]}: #{e.message}"
end

# Directory where JSON files are stored
seeds_directory = Rails.root.join('db', 'seeds')  # Adjust to your folder if needed

# Find all JSON files ending in -data.json
json_files = Dir.glob("#{seeds_directory}/*-data.json")

# Process each JSON file
json_files.each do |seeds|
  # Load and parse the JSON data
  begin
    puts "Processing file: #{seeds}"
    file_data = JSON.parse(File.read(seeds))

    # Seed data from the file
    file_data.each do |plant_data|
      plant_attributes = {
        common_name: plant_data['common_name'],
        picture: plant_data['picture'],
        scientific_name: plant_data['scientific_name'],
        family: plant_data['family'],
        zone: plant_data['zone'],
        perennial: plant_data['perennial'],
        layers: plant_data['layers'],
        plant_function: plant_data['plant_function'],
        description: plant_data['description'],
        conditions: plant_data['conditions'],
        purpose: plant_data['purpose'],
        companions: plant_data['companions'],
        avoid: plant_data['avoid'],
        pests: plant_data['pests']
      }

      create_or_update_plant(plant_attributes)
    end

    puts "Successfully processed: #{seeds}"
  rescue JSON::ParserError => e
    puts "Failed to parse file #{seeds}: #{e.message}"
  rescue => e
    puts "Error processing file #{seeds}: #{e.message}"
  end
end
