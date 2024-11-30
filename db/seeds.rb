# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Plant.find_or_create_by!(common_name: "Rosemary") do |plant|
  plant.picture = "rosemary.png"
  plant.common_name = "Rosemary"
  plant.scientific_name = "Rosmarinus officinalis"
  plant.family = "Lamiaceae"
  plant.zone = "5-9"
  plant.perennial = true
  plant.layers = ["Ground Cover", "Herbaceous"]
  plant.function = ["Companion Planting", "Pest Deterrent","Medicinal", "Culinary", "Soil Health", "Ground Cover", "Windbreak", "Microclimate Creation"]
  plant.purpose = "Rosemary is used for companion planting to deter pests, improve soil health, and provide medicinal and culinary uses. It is drought-tolerant and helps with erosion control. As a perennial, it reduces water usage and maintenance. It also serves as a windbreak and can create favorable microclimates in permaculture systems."
end
