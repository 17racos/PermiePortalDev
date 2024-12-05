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

# Seed plants
plants.each { |attributes| create_or_update_plant(attributes) }

  # Add other plants below as needed...
  {
    conditions: "Climate & Temperature: Thrives in temperate regions. Can tolerate a range of temperatures. Sunlight: Prefers full sun to partial shade. Soil: Prefers moist, well-drained soil with a neutral pH.",
    companions: "Apple Tree, Borage, Calendula, Yarrow",
    avoid: "Shallow rooted plants because they may compete with Comfrey's root system",
    pests: "Slugs, Snails"
  }
  plants = [
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
    purpose: <<-DESCRIPTION 
      1. Culinary Uses:
      Flavoring Agent: Rosemary is widely used in cooking, especially for flavoring meats, especially lamb, chicken, and pork, as well as vegetables, soups, stews, and sauces. It has a strong, aromatic flavor that complements many dishes.
      Herb for Roasting: Rosemary is a classic addition to roasted potatoes, roasted vegetables, and even as a flavoring for bread.
      
      2. Medicinal Uses:
      Antioxidant Properties: Rosemary is rich in antioxidants that help protect cells from oxidative stress.
      Anti-inflammatory: It has been traditionally used to reduce inflammation and treat conditions like arthritis.
      Improves Memory and Concentration: Rosemary has a history of being used to improve cognitive function, memory, and concentration.
      Digestive Aid: Rosemary is often used to alleviate indigestion and reduce bloating.
      Stress Relief: Its aromatic oils are used in aromatherapy to relieve stress, anxiety, and fatigue.
      
      3. Cosmetic Uses:
      Skin Care: Rosemary is used in skincare products for its soothing and anti-inflammatory properties. It can help improve circulation and reduce puffiness.
      Hair Care: Rosemary oil is often used in shampoos and conditioners to promote hair growth and reduce dandruff. It is also believed to help improve scalp health.
      
      4. Companion Plant:
      Pest Repellent: Rosemary acts as a natural pest repellent, particularly deterring aphids, whiteflies, and mosquitoes. This makes it useful in permaculture and garden settings.
      Enhances Plant Health: It can be planted near other plants to improve their health, as it can deter certain pests from attacking neighboring plants.
      
      5. Aesthetic and Ornamental Uses:
      Garden Decoration: Rosemary's aromatic leaves and beautiful, small purple flowers make it an attractive plant for gardens. It’s also a popular choice for herb gardens.
      Ground Cover: Some varieties of rosemary grow low to the ground and are used as ground cover or in landscaping to add texture and fragrance.
      
      6. Environmental Benefits:
      Drought Tolerant: Rosemary is hardy and drought-tolerant once established, making it a good plant for water-scarce regions.
      Pollinator-Friendly: The flowers of the rosemary plant attract pollinators such as bees, which helps support local ecosystems.
      
      7. Aromatic and Therapeutic Uses:
      Essential Oil: Rosemary essential oil is used in aromatherapy to help with mental clarity, improve circulation, and relieve stress. It can also be used in massage oils for pain relief.
      In summary, rosemary is a multifunctional plant with uses ranging from culinary and medicinal to environmental and ornamental. Its strong flavor, therapeutic properties, and ability to support biodiversity make it a valuable addition to herb gardens, permaculture systems, and even home healthcare products.
    DESCRIPTION
   }
    
  ] 
# Seed plants
plants.each { |attributes| create_or_update_plant(attributes) }
   
  { 
    conditions: "Climate & Temperature: Prefers Mediterranean climates with mild winters and warm summers. Sunlight: Full sun is ideal for optimal growth. Soil: Well-drained, slightly alkaline soil.",
    companions: "Cabbage, Carrot, Sage, Thyme",
    avoid: "Mint, Basil",
    pests: "Aphids, Whiteflies, Powdery Mildew"
  }
  plants = [
  {
    common_name: "Apple Tree",
    picture: "apple.png",
    scientific_name: "Malus domestica",
    family: "Rosaceae",
    zone: "4-8",
    perennial: true,
    layers: ["Canopy", "Sub-canopy"],
    plant_function: ["Edible", "Wildlife attractor", "Windbreaker"],
    conditions: "Apple trees generally thrive in areas with cold winters and moderate summers. Some varieties can tolerate more extreme temperatures. Apple trees require full sun to thrive, which means they need at least 6–8 hours of direct sunlight per day. More sunlight improves fruit quality and promotes healthy growth. Apple trees prefer well-drained soil, as they do not tolerate standing water around their roots however, they do like consistent moisture. Heavy clay or waterlogged soil can lead to root rot and poor growth. Apple trees prefer lightly acidic soil with a pH of 6.0 to 6.5. Soil that is too alkaline or too acidic can affect nutrient uptake and overall tree health. Most apple trees require cross-pollination from a different apple variety to produce fruit.",
    companions: "Garlic, Chives, Comfrey, Borage, Clover",
    avoid: "Brassicas, Potatoes",
    pests: "Aphids, Codling Moths, Apple Maggot, Spider Mites, Japanese Beetles, Scale Insects"
  }
  ]
  {
    description: "Apple trees are one of the most widely cultivated fruit trees in the world, known for their delicious, nutritious fruit. They are an integral part of permaculture systems due to their multiple benefits, including producing edible fruit, improving soil health, and supporting biodiversity. Apple trees have deep roots that help break up compacted soil, improving water infiltration and enriching the soil when their leaves decompose. They also provide shade, creating cool microclimates for other plants and reducing evaporation rates. Apple trees attract pollinators, such as bees and butterflies, and offer habitat for wildlife. Additionally, they can be used to mitigate climate change by sequestering carbon. Apples are enjoyed fresh, juiced, or turned into products such as cider, applesauce, and jams.",
    purpose: <<-DESCRIPTION
    1. Edible Fruit Production
    Apples: Apple trees produce fruit that is widely consumed fresh, juiced, or processed into a variety of products such as applesauce, apple cider, and apple pie. Apples are a rich source of vitamins, especially Vitamin C, fiber, and antioxidants.
    Culinary Use: The fruit is versatile in the kitchen, used in both sweet and savory dishes.
   
    2. Wildlife Attractor
    Pollinators: Apple trees attract pollinators like bees and butterflies with their blossoms, which is vital for fruit production.
    Habitat: The tree provides shelter and food for various wildlife, including birds, insects, and mammals. The fallen fruit serves as food for animals such as deer, squirrels, and birds.
    
    3. Soil Improvement
    Soil Enrichment: Apple trees contribute organic matter to the soil when their leaves decompose, adding nutrients back into the soil. This is particularly beneficial in permaculture systems, which focus on creating sustainable, self-sustaining ecosystems.
    Improving Soil Structure: The deep roots of apple trees help to break up compacted soil, improving water infiltration and reducing soil erosion.
   
    4. Shade and Wind Protection
    Shade: Apple trees provide shade in the summer, helping to reduce heat in urban environments and creating cooler microclimates for other plants in the garden.
    Windbreak: Their canopy and structure can act as a natural windbreak, protecting more delicate plants and crops from strong winds.
   
    5. Climate Change Mitigation
    Carbon Sequestration: Like other trees, apple trees help sequester carbon from the atmosphere, which contributes to mitigating climate change.
    Temperature Regulation: By offering shade, apple trees can help reduce the urban heat island effect, lowering the ambient temperature in built-up areas.
    
    6. Soil Erosion Control
    Root System: The deep roots of apple trees help stabilize the soil, preventing erosion, especially on slopes or in areas where soil erosion is a concern.
    
    7. Companion Planting
    Benefit to Other Plants: In permaculture and companion planting systems, apple trees benefit neighboring plants by providing shelter and nutrients through their decomposing leaves. Certain plants also help deter pests that could affect apple trees.
    Beneficial Companion Plants: Apple trees work well with plants like garlic, chives, comfrey, and borage, as they can help improve soil health, attract beneficial insects, or repel pests.
    
    8. Cultural and Aesthetic Value
    Ornamental Beauty: The blossoms of apple trees in spring are a beautiful feature in gardens, providing aesthetic value. Apple trees are often used in landscaping for their beauty and functionality.
    Cultural Significance: Apple trees have cultural significance in many societies and are often associated with tradition, folklore, and symbolism, such as in the myth of the "Tree of Knowledge" in the Bible or as symbols of health and prosperity.
    
    9. Economic Value
    Commercial Production: Apple trees are cultivated commercially for their fruit, and orchards can be profitable. There is a wide variety of apple cultivars, each suited for different climates, purposes, and consumer preferences.
    Value-Added Products: Beyond raw apples, various products can be made from apples, such as juices, cider, sauces, and preserves, adding economic value to apple tree cultivation.
    Summary:
    Apple trees are highly valuable in both agricultural and permaculture systems. They provide edible fruit, contribute to soil health, support biodiversity by attracting pollinators, and offer environmental benefits like carbon sequestration and soil erosion control. They also play an important role in windbreaks and shade, support sustainable gardening, and can help create a more resilient and diverse ecosystem.
  DESCRIPTION

  }  
  # Seed plants
  plants.each { |attributes| create_or_update_plant(attributes) }




   