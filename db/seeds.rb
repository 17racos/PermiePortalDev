# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Plant.find_or_create_by!(common_name: "Rosemary") do |plant|
  plant.picture = "rosemary.png" # Update with the correct image path if needed
  plant.scientific_name = "Salvia rosmarinus"
  plant.family = "Lamiaceae"
  plant.zone = "8-10"
  plant.perennial = true
  plant.layers = ["Shrub", "Herbaceous"]
  plant.function = ["Edible", "Medicinal", "Insectary", "Wildlife Attractor", "Windbreaker"]
  plant.description = <<~DESC
    Rosemary is a fragrant, evergreen shrub native to the Mediterranean region, including Portugal and Spain. It belongs to the mint family, Lamiaceae, and is known for its needle-like leaves and white, pink, purple, or blue flowers.

    The plant typically grows between 2 to 6 feet tall and 2 to 4 feet wide, reaching its mature size after several years. It thrives in full sun and well-drained soil, making it suitable for USDA hardiness zones 8 to 10. In colder climates, rosemary can be grown as an annual or potted and brought indoors during winter months.

    Rosemary's aromatic leaves are commonly used as a culinary herb to flavor a variety of dishes, including meats, soups, and breads. The leaves have a pungent, slightly bitter taste and can be used fresh or dried.

    Medicinally, rosemary has been traditionally used to improve memory, relieve muscle pain, and boost the immune and circulatory systems. However, scientific evidence supporting these uses is limited, and it should be used cautiously, especially in large amounts.

    In the garden, rosemary serves multiple functions. Its flowers attract pollinators, making it an excellent insectary plant. The dense foliage can act as a windbreaker, and its drought tolerance makes it suitable for xeriscaping. Additionally, rosemary's strong aroma can deter certain pests, contributing to its role in companion planting.

    Overall, rosemary is a versatile plant valued for its culinary, medicinal, and ornamental qualities, making it a popular choice for herb gardens and landscapes.
  DESC
end

