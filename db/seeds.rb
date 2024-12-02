# Apple
apple = Plant.find_by(common_name: "Apple Tree")
if apple
  apple.update_column(:pests, ["Aphids: These tiny, soft-bodied insects feed on the sap of apple trees, weakening the plant and spreading disease. They also produce honeydew, which can encourage the growth of sooty mold.",
    "Codling Moths: The larvae of these moths burrow into apple fruits, causing damage and making the fruit unappetizing or unusable.",
    "Apple Maggot: This pests's larvae tunnel through apple fruit, causing internal damage and making the fruit rot prematurely.",
    "Spider Mites: These tiny arachnids feed on the underside of apple tree leaves, causing yellowing, stippling, and leaf drop.",
    "Japanese Beetles: These beetles eat leaves, flowers, and fruit, causing significant damage to apple trees. They tend to leave skeletonized foliage.",
    "Scale Insects: These pests feed on the sap of apple trees, particularly on branches and twigs, leading to weakened growth and the spread of sooty mold."].to_json)
  puts "Updated pests for Apple."
else
  puts "Apple plant not found. Please ensure it exists in the database."
end

# Rosemary
rosemary = Plant.find_by(common_name: "Rosemary")
if rosemary
  rosemary.update_column(:pests, ["Aphids: Aphids can also target rosemary, feeding on its tender shoots and causing wilting or deformed growth.",
    "Whiteflies: These tiny, winged pests feed on the undersides of rosemary leaves, weakening the plant by sucking sap and potentially transmitting plant viruses.",
    "Spider Mites: Rosemary is also susceptible to spider mites, which cause damage similar to that on apple trees. Their feeding leads to yellowing and a stippled appearance on the leaves.",
    "Mealybugs: These pests are covered in a white, cotton-like substance. They feed on the plant’s sap, causing leaves to yellow and become distorted.",
    "Root Aphids: These pests target the root system of rosemary, causing stunted growth and general plant decline.",
    "Caterpillars: Some types of caterpillars feed on the leaves of rosemary plants, leaving holes and possibly causing defoliation."].to_json)
  puts "Updated pests for Rosemary."
else
  puts "Rosemary plant not found. Please ensure it exists in the database."
end

# Comfrey
comfrey = Plant.find_by(common_name: "Comfrey")
if comfrey
  comfrey.update_column(:pests, ["Aphids: Aphids are common on comfrey plants, feeding on the tender shoots and causing distortion or yellowing of leaves.",
    "Slugs and Snails: These pests chew on comfrey leaves, leaving ragged holes in the foliage, especially during wet conditions.",
    "Caterpillars: Various types of caterpillars may feed on comfrey leaves, including the larvae of butterflies or moths.",
    "Leaf Spot Fungi: Fungal diseases can affect comfrey, leading to leaf spots that can weaken the plant and hinder its growth.",
    "Root Knot Nematodes: Microscopic pests attack the roots of comfrey, causing swelling and stunted growth."].to_json)
  puts "Updated pests for Comfrey."
else
  puts "Comfrey plant not found. Please ensure it exists in the database."
end
