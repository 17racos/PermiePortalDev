# Helper method to create or update a plant
def create_or_update_plant(attributes)
  puts "Attributes being passed to create/update: #{attributes.inspect}"  # Debugging line
  plant = Plant.find_by("(common_name) = ?", attributes[:common_name])
  if plant
    puts "Updating #{attributes[:common_name]}"
    plant.update!(attributes)
  else
    puts "Creating #{attributes[:common_name]}"
    Plant.create!(attributes)  # Only call create once
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to seed #{attributes[:common_name]}: #{e.message}"
end

# Directory where YAML files are stored
seeds_directory = Rails.root.join('db', 'seeds')  # Adjust to your folder if needed

# Find all YAML files ending in -data.yml
yaml_files = Dir.glob("#{seeds_directory}/*-data.yml")

# Process each YAML file
yaml_files.each do |yaml_file|
  # Assuming you're reading from a YAML file
  begin
    puts "Processing file: #{yaml_file}"
    file_data = YAML.load_file(yaml_file)

    # Example usage of the structure within `file_data`
    file_data.each do |plant_data|
      plant_attributes = {
        common_name: plant_data['common_name'],
        picture: plant_data['picture'],
        scientific_name: plant_data['scientific_name'],
        family: plant_data['family'],
        zone: plant_data['zone'].map(&:to_i), # Ensure zone is an array of integers
        perennial: plant_data['perennial'],
        layers: plant_data['layers'],
        plant_function: plant_data['plant_function'],
        description: plant_data['description'],
        grow_conditions: plant_data['grow_conditions'],
        purpose: plant_data['purpose'],
        companions: plant_data['companions'],
        avoid: plant_data['avoid'],
        pests: plant_data['pests']
      }
    
      create_or_update_plant(plant_attributes)
    end

    puts "Successfully processed: #{yaml_file}"
  rescue Psych::SyntaxError => e
    puts "Failed to parse file #{yaml_file}: #{e.message}"
  rescue => e
    puts "Error processing file #{yaml_file}: #{e.message}"
  end
end
