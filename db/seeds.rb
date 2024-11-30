# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Plant.find_or_create_by!(common_name: "Apple Tree") do |plant|
  plant.picture = "apple.png"
  plant.common_name = "Apple Tree"
  plant.scientific_name = "Malus domestica"
  plant.family = "Rosaceae"
  plant.zone = "4-8"
  plant.perennial = true,
  plant.layers = ["Canopy", "Sub-canopy"]
  plant.function = ["Edible", "Wildlife attractor", "Windbreaker"]
end

Plant.find_or_create_by!(common_name: "Comfrey") do |plant|
    plant.picture = "comfrey.png"
    plant.scientific_name = "Symphytum officinale"
    plant.family = "Boraginaceae"
    plant.zone = "3-9"
    plant.perennial = true
    plant.layers = ["Herbaceous"]
    plant.function = ["Medicinal", "Dynamic Accumulator", "Mulcher"]
  end
  