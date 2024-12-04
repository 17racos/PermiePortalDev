# Seeding Apple Tree
apple = Plant.find_or_initialize_by(common_name: "Apple Tree") do |plant|
  plant.picture = "apple.png"
  plant.scientific_name = "Malus domestica"
  plant.family = "Rosaceae"
  plant.zone = "4-8"
  plant.perennial = true
  plant.layers = ["Canopy", "Sub-canopy"]
  plant.functions = ["Edible", "Wildlife attractor", "Windbreaker"]
  plant.purpose = "Apple trees offer a wide range of benefits in permaculture systems, including edible produce, biodiversity support, soil improvement, shade, dynamic accumulation, and carbon sequestration."
  plant.conditions = "Climate & Temperature: Best grown in temperate climates with cool winters and moderate summers. Requires winter chill hours for proper fruiting. Sunlight: Full sun for at least 6-8 hours a day. Soil: Slightly acidic, well-drained soil with a pH of 6.0 to 7.0."
  plant.companions = "Garlic, Chives, Comfrey, Borage, Clover"
  plant.avoid = "Brassicas, Potatoes"
  plant.pests = "Aphids, Codling Moths, Apple Maggot, Spider Mites, Japanese Beetles, Scale Insects"
end
apple.save!
puts "Seeding Apple Tree..."

# Seeding Rosemary
rosemary = Plant.find_or_initialize_by(common_name: "Rosemary") do |plant|
  plant.picture = "rosemary.png"
  plant.scientific_name = "Rosmarinus officinalis"
  plant.family = "Lamiaceae"
  plant.zone = "7-10"
  plant.perennial = true
  plant.layers = ["Herbaceous"]
  plant.functions = ["Culinary", "Medicinal", "Companion plant"]
  plant.purpose = "Rosemary is a versatile herb used for culinary, medicinal, and companion planting purposes. It enhances flavor in dishes and is known for its health benefits, including antioxidant and anti-inflammatory properties."
  plant.conditions = "Climate & Temperature: Prefers Mediterranean climates with mild winters and warm summers. Sunlight: Full sun is ideal for optimal growth. Soil: Well-drained, slightly alkaline soil."
  plant.companions = "Cabbage, Carrot, Sage, Thyme"
  plant.avoid = "Mint, Basil"
  plant.pests = "Aphids, Whiteflies, Powdery Mildew"
end
rosemary.save!
puts "Seeding Rosemary..."

# Seeding Comfrey
comfrey = Plant.find_or_initialize_by(common_name: "Comfrey") do |plant|
  plant.picture = "comfrey.png"
  plant.scientific_name = "Symphytum officinale"
  plant.family = "Boraginaceae"
  plant.zone = "3-9"
  plant.perennial = true
  plant.layers = ["Herbaceous"]
  plant.functions = ["Medicinal", "Dynamic Accumulator", "Mulcher"]
  plant.purpose = "Comfrey is a powerful medicinal herb and dynamic accumulator. It’s excellent for enriching soil, composting, mulching, and providing medicinal properties such as wound healing."
  plant.conditions = "Climate & Temperature: Thrives in temperate regions. Can tolerate a range of temperatures. Sunlight: Prefers full sun to partial shade. Soil: Prefers moist, well-drained soil with a neutral pH."
  plant.companions = "Apple Tree, Borage, Calendula, Yarrow"
  plant.avoid = "None specified"
  plant.pests = "Slugs, Snails"
end
comfrey.save!
puts "Seeding Comfrey..."
