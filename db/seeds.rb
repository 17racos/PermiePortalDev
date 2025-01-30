# Helper method to create or update a record
def create_or_update_record(model, find_by_attr, attributes)
  record = model.find_or_initialize_by(find_by_attr => attributes[find_by_attr])
  if record.new_record?
    puts "Creating #{model} - #{attributes[find_by_attr]}"
  else
    puts "Updating #{model} - #{attributes[find_by_attr]}"
  end
  record.assign_attributes(attributes)
  record.save!
rescue ActiveRecord::RecordInvalid => e
  puts "Failed to seed #{model} - #{attributes[find_by_attr]}: #{e.message}"
end

# Load file data based on format
def load_file_data(file_path, format)
  case format
  when :yaml
    YAML.load_file(file_path)
  when :json
    JSON.parse(File.read(file_path))
  when :csv
    CSV.foreach(file_path, headers: true, header_converters: :symbol).map(&:to_h)
  else
    raise ArgumentError, "Unsupported file format: #{format}"
  end
end


# Map attributes for plants
def map_plant_attributes(data)
  {
    common_name: data['common_name'],
    picture: data['picture'],
    scientific_name: data['scientific_name'],
    aka: data['aka'],
    family: data['family'],
    zone: data['zone'],
    perennial: data['perennial'],
    layers: data['layers'],
    plant_function: data['plant_function'],
    description: data['description'],
    purpose: data['purpose'],
    companions: data['companions'],
    avoid: data['avoid'],
    pests: data['pests']
  }
end

# Map attributes for pests
def map_pest_attributes(data)
  {
    name: data['name'],
    picture: data['picture'],
    scientific_name: data['scientific_name'],
    description: data['description'],
    characteristics: data['characteristics'],
    control_methods: data['control_methods'],
    natural_enemies: data['natural_enemies']
  }
end

# Seed pests from pests-data.yml
def seed_pests
  pests_file = Rails.root.join('db', 'seeds', 'pests-data.yml')
  unless File.exist?(pests_file)
    puts "No pests-data.yml file found. Skipping pest seeding."
    return
  end

  puts "Seeding pests from #{pests_file}..."
  pests_data = load_file_data(pests_file, :yaml)

  pests_data.each do |data|
    attributes = map_pest_attributes(data)
    create_or_update_record(Pest, :name, attributes)
  end

  puts "Pests seeded successfully!"
end

# Seed plants and establish relationships with pests
def seed_plants
  plant_files = Dir.glob(Rails.root.join('db', 'seeds', '*-data.yml')).reject { |f| f.include?('pests-data.yml') }

  plant_files.each do |file|
    puts "Processing file: #{file}"
    plant_data = load_file_data(file, :yaml)

    plant_data.each do |data|
      attributes = map_plant_attributes(data)
      pests = attributes.delete(:pests) || []

      plant = Plant.find_or_initialize_by(common_name: attributes[:common_name])
      if plant.new_record?
        puts "Creating plant: #{attributes[:common_name]}"
      else
        puts "Updating plant: #{attributes[:common_name]}"
      end

      plant.assign_attributes(attributes)
      plant.save!

      # Associate pests with the plant
      valid_pests = Pest.where(name: pests)
      plant.pests = valid_pests
    end

    puts "Finished processing file: #{file}"
  end
rescue ActiveRecord::RecordInvalid => e
  puts "Error while seeding plants: #{e.message}"
end

# Main seed execution
def run_seeds
  seed_pests        # Step 1: Seed pests first
  seed_plants       # Step 2: Seed plants and establish relationships
  puts "Seeding completed!"
rescue StandardError => e
  puts "An error occurred during seeding: #{e.message}"
end

# Run the seeds
run_seeds
