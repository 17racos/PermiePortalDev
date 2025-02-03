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
    pests: data['pests'],
    min_temp: data['min_temp'],
    max_temp: data['max_temp'],
    ideal_temp_max: data['ideal_temp_min'],
    ideal_temp_max: data['ideal_temp_max'],
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

# db/seeds.rb

guides = [
  {
    title: 'Vermicomposting',
    body: 'Discover the art of vermicomposting, a sustainable gardening technique that uses worms to turn organic waste into nutrient-rich compost. Vermicomposting helps reduce food waste, enriches your soil with essential nutrients, and supports eco-friendly gardening practices. This guide covers everything from choosing the right worms, like red wigglers, to setting up a worm bin and maintaining a thriving compost system. Perfect for beginners and seasoned gardeners, vermicomposting is an easy and effective way to create organic compost that boosts plant growth and improves soil health. Start your worm composting journey today and transform kitchen scraps into a valuable resource for your garden.',
    image: 'vermicompost.jpg'
  },
  {
    title: 'How to Make a Worm Bin',
    body: 'Creating a DIY worm bin is an easy and affordable way to start vermicomposting at home. A well-designed worm bin provides the perfect environment for red wigglers to thrive while efficiently breaking down food scraps into nutrient-rich compost. This guide walks you through selecting the right container, adding ventilation and drainage, and preparing bedding to keep your worms healthy and productive. Whether you are setting up a bin for an indoor or outdoor composting system, this step-by-step guide ensures success. Build your own worm bin today and take the first step toward sustainable waste reduction and organic soil enrichment!',
    image: 'how-to-make-a-worm-bin.jpg'
  },
  {
    title: 'Turmeric Informational',
    body: 'Turmeric (Curcuma longa), often called the "Golden Spice," is a powerful superfood known for its anti-inflammatory, antioxidant, and immune-boosting properties. This ancient root has been used for centuries in Ayurvedic and Traditional Chinese Medicine to promote health and well-being. The active compound, **curcumin**, is scientifically proven to support joint health, aid digestion, improve brain function, and help prevent chronic diseases such as heart disease, diabetes, and cancer. Turmeric is also a natural remedy for arthritis, skin conditions, and gut health. Learn how to maximize its benefits by combining it with black pepper for enhanced absorption and incorporating it into your diet through golden milk, turmeric tea, or curcumin supplements. Whether used as a culinary spice, herbal remedy, or skincare ingredient, turmeric remains a cornerstone of natural health and holistic wellness. Discover the science behind its healing potential, the best ways to consume it, and how to harness the power of this remarkable spice for optimal health and longevity.',
    image: 'turmeric-informational.jpg'
  },
  {
    title: 'Moringa Informational',
    body: 'Discover the incredible health benefits of Moringa oleifera, also known as the "Miracle Tree." This nutrient-dense superfood is packed with antioxidants, vitamins, and minerals that support immune function, heart health, brain function, and digestive well-being. Moringa is a powerful anti-inflammatory and detoxifying plant that aids in blood sugar regulation, skin rejuvenation, and energy boost. Learn how to incorporate moringa powder, leaves, seeds, and oil into your diet to maximize its medicinal and nutritional properties. Explore the sustainable benefits of moringa for soil restoration, carbon sequestration, and water purification. Whether you are looking for a natural supplement, a plant-based protein source, or a holistic approach to wellness, Moringa is the ultimate superfood for health and sustainability.',
    image: 'moringa-informational.jpg'
  },
  {
    title: 'Plant Families',
    body: 'Unlock the secrets of plant families and discover how understanding botanical relationships can transform your gardening and permaculture practices. This guide explores the major plant families, their unique characteristics, and how they influence companion planting and crop rotation. Learn how grouping plants by family can improve soil health, optimize nutrient cycling, and reduce pests naturally. Whether you are planning a vegetable garden or creating a diverse permaculture system, this guide will help you harness the power of plant families for sustainable and efficient garden design. Perfect for gardeners and permaculture enthusiasts alike, start exploring plant relationships today!',
    image: 'plant-families.jpg'
  }
]

guides.each do |guide|
  Guide.find_or_create_by(title: guide[:title]) do |g|
    g.body = guide[:body]
    g.image = guide[:image]  # Just assigning the image filename as a string
  end
end

puts "#{guides.size} guides have been added or updated."
