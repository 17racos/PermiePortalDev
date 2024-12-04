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

# Seed data
plants = [
  {
    common_name: "Comfrey",
    picture: "comfrey.png",
    scientific_name: "Symphytum officinale",
    family: "Boraginaceae",
    zone: "3-9",
    perennial: true,
    layers: ["Herbaceous"],
    plant_function: ["Medicinal", "Dynamic Accumulator", "Mulcher"],
    description: "Comfrey is a perennial herb known for its powerful medicinal properties and its ability to improve soil health. It is often referred to as a dynamic accumulator because of its deep roots, which absorb nutrients from the soil and bring them to the surface. Comfrey’s leaves are rich in potassium, calcium, and other minerals, making it a valuable addition to compost and as a mulch for enriching the soil. Medicinally, comfrey has been used for centuries to treat wounds, bruises, and inflammation, as it promotes tissue healing. It’s a versatile plant that also attracts pollinators and supports biodiversity in permaculture systems.",
    purpose: "Comfrey is a powerful medicinal herb and dynamic accumulator. It’s excellent for enriching soil, composting, mulching, and providing medicinal properties such as wound healing.",
    conditions: "Climate & Temperature: Thrives in temperate regions. Can tolerate a range of temperatures. Sunlight: Prefers full sun to partial shade. Soil: Prefers moist, well-drained soil with a neutral pH.",
    companions: "Apple Tree, Borage, Calendula, Yarrow",
    avoid: "Shallow rooted plants because they may compete with Comfrey's root system",
    pests: "Slugs, Snails"
  },
  {
    common_name: "Rosemary",
    picture: "rosemary.png",
    scientific_name: "Rosmarinus officinalis",
    family: "Lamiaceae",
    zone: "7-10",
    perennial: true,
    layers: ["Herbaceous"],
    plant_function: ["Culinary", "Medicinal", "Companion plant"],
    description: "Rosemary is a versatile evergreen herb native to the Mediterranean region. It is widely used in culinary applications for its aromatic leaves, which add flavor to various dishes, especially meats, stews, and soups. In addition to its culinary uses, rosemary is prized for its medicinal properties, such as being an antioxidant and anti-inflammatory agent. It also has a long history in traditional medicine, where it was used to improve memory, relieve stress, and promote circulation. Rosemary is a hardy plant that thrives in full sun and well-drained soil, making it an excellent choice for herb gardens and permaculture designs. It also serves as a companion plant, benefiting neighboring plants by repelling certain pests.",
    purpose: "Rosemary is a versatile herb used for culinary, medicinal, and companion planting purposes. It enhances flavor in dishes and is known for its health benefits, including antioxidant and anti-inflammatory properties.",
    conditions: "Climate & Temperature: Prefers Mediterranean climates with mild winters and warm summers. Sunlight: Full sun is ideal for optimal growth. Soil: Well-drained, slightly alkaline soil.",
    companions: "Cabbage, Carrot, Sage, Thyme",
    avoid: "Mint, Basil",
    pests: "Aphids, Whiteflies, Powdery Mildew"
  },
  {
    common_name: "Apple Tree",
    picture: "apple.png",
    scientific_name: "Malus domestica",
    family: "Rosaceae",
    zone: "4-8",
    perennial: true,
    layers: ["Canopy", "Sub-canopy"],
    plant_function: ["Edible", "Wildlife attractor", "Windbreaker"],
    description: "Apple trees are one of the most widely cultivated fruit trees in the world, known for their delicious, nutritious fruit. They are an integral part of permaculture systems due to their multiple benefits, including producing edible fruit, improving soil health, and supporting biodiversity. Apple trees have deep roots that help break up compacted soil, improving water infiltration and enriching the soil when their leaves decompose. They also provide shade, creating cool microclimates for other plants and reducing evaporation rates. Apple trees attract pollinators, such as bees and butterflies, and offer habitat for wildlife. Additionally, they can be used to mitigate climate change by sequestering carbon. Apples are enjoyed fresh, juiced, or turned into products such as cider, applesauce, and jams.",
    purpose: "Apple trees offer a wide range of benefits in permaculture systems...",
    conditions: "Climate & Temperature: Best grown in temperate climates...",
    companions: "Garlic, Chives, Comfrey, Borage, Clover",
    avoid: "Brassicas, Potatoes",
    pests: "Aphids, Codling Moths, Apple Maggot, Spider Mites, Japanese Beetles, Scale Insects"
  }
]

# Seed plants
plants.each { |attributes| create_or_update_plant(attributes) }