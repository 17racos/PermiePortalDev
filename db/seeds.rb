# Apple
apple = Plant.find_by(common_name: "Apple Tree")
if apple
  apple.update_column(:companions, ["Garlic", "Chives", "Comfrey", "Borage", "Clover"].to_json)
  puts "Updated companions for Apple."
else
  puts "Apple plant not found. Please ensure it exists in the database."
end

# Rosemary
rosemary = Plant.find_by(common_name: "Rosemary")
if rosemary
  rosemary.update_column(:companions, ["Sage", "Thyme", "Lavender", "Carrots", "Beans"].to_json)
  puts "Updated companions for Rosemary."
else
  puts "Rosemary plant not found. Please ensure it exists in the database."
end

# Comfrey
comfrey = Plant.find_by(common_name: "Comfrey")
if comfrey
  comfrey.update_column(:companions, ["Fruit Trees", "Nut Trees", "Vegetable Crops"].to_json)
  puts "Updated companions for Comfrey."
else
  puts "Comfrey plant not found. Please ensure it exists in the database."
end
