# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Plant.find_or_create_by!(common_name: "Comfrey") do |plant|

  plant.layers = ["Herbaceous"]
  plant.function = ["Medicinal", "Dynamic Accumulator", "Mulcher"]

  # Assigning the multi-line purpose text
  plant.purpose = <<-PURPOSE
    Comfrey is an incredibly versatile and beneficial plant for permaculture systems. Its ability to improve soil health, accumulate nutrients, support biodiversity, and provide fodder and medicinal benefits make it an essential component of sustainable farming and gardening practices.
    - Soil Improvement: Comfrey's deep roots access nutrients from deep within the soil and enrich the topsoil when its leaves decompose.
    - Dynamic Accumulator: Comfrey accumulates potassium, calcium, and other minerals, enriching the soil for surrounding plants.
    - Compost Activator: Comfrey accelerates composting due to its high nitrogen content.
    - Mulching Material: Comfrey leaves are an excellent mulch that retains moisture, suppresses weeds, and adds nutrients to the soil.
    - Animal Fodder: Comfrey is highly nutritious and can be used to supplement animal diets.
    - Medicinal Uses: Known for promoting cell regeneration, comfrey has been used to treat wounds, bruises, and inflammation.
    - Biodiversity Support: Comfrey attracts pollinators, improving biodiversity in the garden.
    - Low Maintenance: Once established, comfrey requires little maintenance and thrives in various soil conditions.
  PURPOSE
end
