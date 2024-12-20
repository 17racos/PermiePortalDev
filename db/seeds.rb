# Helper method to create or update a plant
def create_or_update_plant(attributes)
  plant = Plant.find_by(common_name: attributes[:common_name])
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

# Load all YAML, JSON, or CSV files
seeds_directory = Rails.root.join('db', 'seeds')
yaml_files = Dir.glob("#{seeds_directory}/*-data.yml")
json_files = Dir.glob("#{seeds_directory}/*-data.json")
csv_files = Dir.glob("#{seeds_directory}/*-data.csv")

# Handling YAML files
yaml_files.each do |yaml_file|
  begin
    puts "Processing file: #{yaml_file}"
    file_data = YAML.load_file(yaml_file)

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
        grow_conditions: plant_data['grow_conditions'],
        purpose: plant_data['purpose'],
        companions: plant_data['companions'],
        avoid: plant_data['avoid'],
        pests: plant_data['pests']
      }

      create_or_update_plant(plant_attributes)
    end
    puts "Successfully processed: #{yaml_file}"
  rescue => e
    puts "Error processing file #{yaml_file}: #{e.message}"
  end
end

# Handling JSON files
json_files.each do |json_file|
  begin
    puts "Processing file: #{json_file}"
    file_data = JSON.parse(File.read(json_file))

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
        grow_conditions: plant_data['grow_conditions'],
        purpose: plant_data['purpose'],
        companions: plant_data['companions'],
        avoid: plant_data['avoid'],
        pests: plant_data['pests']
      }

      create_or_update_plant(plant_attributes)
    end
    puts "Successfully processed: #{json_file}"
  rescue => e
    puts "Error processing file #{json_file}: #{e.message}"
  end
end

# Handling CSV files
csv_files.each do |csv_file|
  begin
    puts "Processing file: #{csv_file}"
    CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |row|
      plant_attributes = {
        common_name: row[:common_name],
        picture: row[:picture],
        scientific_name: row[:scientific_name],
        family: row[:family],
        zone: row[:zone].split(',').map(&:to_i),
        perennial: row[:perennial],
        layers: row[:layers].split(','),
        plant_function: row[:plant_function].split(','),
        description: row[:description],
        purpose: row[:purpose],
        companions: row[:companions].split(','),
        avoid: row[:avoid].split(','),
        pests: row[:pests].split(',')
      }

      create_or_update_plant(plant_attributes)
    end
    puts "Successfully processed: #{csv_file}"
  rescue => e
    puts "Error processing file #{csv_file}: #{e.message}"
  end
end
