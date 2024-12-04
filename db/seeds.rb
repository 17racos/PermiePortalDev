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
    purpose: <<-DESCRIPTION
      1. **Medicinal Uses:**
      Comfrey has been used for centuries in traditional medicine, primarily for its ability to promote healing. The plant contains allantoin, a compound known to help stimulate cell growth, making it useful for:

      - **Wound Healing:** Comfrey has been traditionally used as a poultice for cuts, bruises, sprains, and fractures. It is believed to speed up the healing process and reduce swelling and inflammation.
      - **Anti-inflammatory:** Comfrey is known for its ability to reduce inflammation, making it useful for joint pain and muscle strains.
      - **Pain Relief:** Applied topically, comfrey may help soothe pain, especially in musculoskeletal issues.

      2. **Soil Fertilizer and Mulch:**
      Comfrey is often used in gardening and permaculture for its ability to:

      - **Nutrient-Rich Compost:** Comfrey leaves are rich in nutrients like nitrogen, potassium, and phosphorus. These nutrients are essential for plant growth, so the plant can be used to create highly beneficial compost or mulch.
      - **Comfrey Tea:** The leaves can be used to make a liquid fertilizer known as comfrey tea, which is high in potassium and beneficial for flowering and fruiting plants. This liquid fertilizer is great for tomatoes, peppers, and other heavy feeders.
      - **Dynamic Accumulator:** Comfrey is considered a "dynamic accumulator," meaning it pulls up minerals from deep in the soil, making them available to other plants when the leaves are used as mulch or composted.

      3. **Animal Feed:**
      Comfrey is sometimes used as fodder for animals:

      - **Livestock Feed:** Comfrey is high in protein and can be fed to livestock like goats, chickens, and rabbits. It can also be used to feed herbivores, though care should be taken because it contains pyrrolizidine alkaloids, which can be toxic in large amounts.
      - **Comfrey Hay:** Some farmers use comfrey as a high-protein forage crop, drying the leaves and making them into hay for their animals.

      4. **Soil Erosion Control:**
      Comfrey has deep, strong roots that can help prevent soil erosion, particularly on steep slopes or areas where soil stability is a concern. The roots help bind the soil together, reducing the risk of erosion from wind or water.

      5. **Permaculture Uses:**
      In permaculture, comfrey is highly valued for its ability to support sustainable gardening practices:

      - **Pioneer Plant:** Comfrey is often used in permaculture systems as a pioneer plant to establish healthy soil and improve the ecosystem by adding nutrients back into the soil.
      - **Comfrey as a Green Manure:** Comfrey can be grown and turned back into the soil to add organic matter and nutrients, improving soil health and fertility over time.

      6. **Cosmetic and Skin Care:**
      Comfrey is also found in some cosmetic products due to its skin-healing properties. It is often used in:

      - **Lotions and Creams:** Due to its soothing and healing effects on the skin, comfrey extracts are used in products for dry, damaged skin or conditions like eczema.
      - **Hair Care:** Some shampoos and conditioners contain comfrey for its moisturizing and restorative properties.

      7. **Other Uses:**
      - **Insect Repellent:** The plant can also be used to repel pests in gardens. The strong aroma of comfrey may help deter certain insects.
      - **Pollinator-Friendly Plant:** Comfrey flowers are attractive to bees and other pollinators, making it a great addition to a pollinator-friendly garden.

      **Key Considerations:**
      While comfrey is highly beneficial in many contexts, it is important to be cautious about its use, particularly for internal consumption, due to the presence of pyrrolizidine alkaloids (PAs) in the roots and leaves. These compounds can be toxic to the liver if consumed in large quantities over time, so comfrey should only be used externally or under the guidance of a healthcare professional.
    DESCRIPTION
  },
  # Add other plants below as needed...
]

# Seed plants
plants.each { |attributes| create_or_update_plant(attributes) }

  # Add other plants below as needed...
  {
    conditions: "Climate & Temperature: Thrives in temperate regions. Can tolerate a range of temperatures. Sunlight: Prefers full sun to partial shade. Soil: Prefers moist, well-drained soil with a neutral pH.",
    companions: "Apple Tree, Borage, Calendula, Yarrow",
    avoid: "Shallow rooted plants because they may compete with Comfrey's root system",
    pests: "Slugs, Snails"
  }
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
  }
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

# Seed plants
plants.each { |attributes| create_or_update_plant(attributes) }