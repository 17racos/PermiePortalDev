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
        zones: plant_data['zones'],
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

# Plant data that is not from JSON files but hardcoded (e.g., "Comfrey")
plants = [
  {
    common_name: "Comfrey",
    picture: "comfrey.png",
    scientific_name: "Symphytum officinale",
    family: "Boraginaceae",
    zones: ["3", "4", "5", "6", "7", "8", "9"],
    perennial: true,
    layers: ["Herbaceous"],
    plant_function: ["Medicinal", "Dynamic Accumulator", "Mulcher"],
    description: "Comfrey is a perennial herb known for its powerful medicinal properties and its ability to improve soil health. It is often referred to as a dynamic accumulator because of its deep roots, which absorb nutrients from the soil and bring them to the surface. Comfrey’s leaves are rich in potassium, calcium, and other minerals, making it a valuable addition to compost and as a mulch for enriching the soil.",
    purpose: <<-DESCRIPTION
      1. Medicinal Uses:
      Comfrey has been used for centuries in traditional medicine, primarily for its ability to promote healing. The plant contains allantoin, a compound known to help stimulate cell growth, making it useful for:

      - Wound Healing: Comfrey has been traditionally used as a poultice for cuts, bruises, sprains, and fractures. It is believed to speed up the healing process and reduce swelling and inflammation.
      - Anti-inflammatory: Comfrey is known for its ability to reduce inflammation, making it useful for joint pain and muscle strains.
      - Pain Relief: Applied topically, comfrey may help soothe pain, especially in musculoskeletal issues.

      2. Soil Fertilizer and Mulch:
      Comfrey is often used in gardening and permaculture for its ability to:

      - Nutrient-Rich Compost: Comfrey leaves are rich in nutrients like nitrogen, potassium, and phosphorus. These nutrients are essential for plant growth, so the plant can be used to create highly beneficial compost or mulch.
      - Comfrey Tea: The leaves can be used to make a liquid fertilizer known as comfrey tea, which is high in potassium and beneficial for flowering and fruiting plants. This liquid fertilizer is great for tomatoes, peppers, and other heavy feeders.
      - Dynamic Accumulator: Comfrey is considered a "dynamic accumulator," meaning it pulls up minerals from deep in the soil, making them available to other plants when the leaves are used as mulch or composted.

      3. Animal Feed:
      Comfrey is sometimes used as fodder for animals:

      - Livestock Feed: Comfrey is high in protein and can be fed to livestock like goats, chickens, and rabbits. It can also be used to feed herbivores, though care should be taken because it contains pyrrolizidine alkaloids, which can be toxic in large amounts.
      - Comfrey Hay: Some farmers use comfrey as a high-protein forage crop, drying the leaves and making them into hay for their animals.

      4. Soil Erosion Control:
      Comfrey has deep, strong roots that can help prevent soil erosion, particularly on steep slopes or areas where soil stability is a concern. The roots help bind the soil together, reducing the risk of erosion from wind or water.

      5. Permaculture Uses:
      In permaculture, comfrey is highly valued for its ability to support sustainable gardening practices:

      - Pioneer Plant: Comfrey is often used in permaculture systems as a pioneer plant to establish healthy soil and improve the ecosystem by adding nutrients back into the soil.
      - Comfrey as a Green Manure: Comfrey can be grown and turned back into the soil to add organic matter and nutrients, improving soil health and fertility over time.

      6. Cosmetic and Skin Care:
      Comfrey is also found in some cosmetic products due to its skin-healing properties. It is often used in:

      - Lotions and Creams: Due to its soothing and healing effects on the skin, comfrey extracts are used in products for dry, damaged skin or conditions like eczema.
      - Hair Care: Some shampoos and conditioners contain comfrey for its moisturizing and restorative properties.

      7. Other Uses:
      - Insect Repellent: The plant can also be used to repel pests in gardens. The strong aroma of comfrey may help deter certain insects.
      - Pollinator-Friendly Plant: Comfrey flowers are attractive to bees and other pollinators, making it a great addition to a pollinator-friendly garden.

      Key Considerations:
      While comfrey is highly beneficial in many contexts, it is important to be cautious about its use, particularly for internal consumption, due to the presence of pyrrolizidine alkaloids (PAs) in the roots and leaves. These compounds can be toxic to the liver if consumed in large quantities over time, so comfrey should only be used externally or under the guidance of a healthcare professional.
    DESCRIPTION
  }
]

# Seed hardcoded plants (e.g., Comfrey)
plants.each { |attributes| create_or_update_plant(attributes) }
