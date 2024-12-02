# Apple
apple = Plant.find_by(common_name: "Apple Tree")
if apple
  apple.update_column(:conditions, ["Climate & Temperature:

Ideal Temperature: Apple trees grow best in temperate climates with cool winters and moderate summers. The ideal temperature range is 75°F to 85°F (24°C to 29°C) during the growing season, and they require winter chill hours to fruit properly.
Hardiness: Apple trees are hardy in USDA zones 3–8, depending on the variety. They need a period of dormancy (cold temperatures) during winter for proper fruiting.
Sunlight:

Full Sun: Apple trees need full sun for at least 6–8 hours a day to produce healthy fruit. Sunlight is essential for photosynthesis and fruit development.
Soil:

Well-Drained, Fertile Soil: Apple trees prefer slightly acidic, well-drained soil with a pH of 6.0 to 7.0. Sandy loam or loamy soil with good fertility is ideal.
Soil Requirements: The soil should be deep enough for the roots to spread and access nutrients.
Watering:

Moderate Watering: Apple trees need regular watering, particularly during dry spells. However, they do not like waterlogged soil, so ensure good drainage.
Watering Frequency: Water deeply but infrequently to promote strong root development. In the growing season, once a week is often sufficient unless there’s heavy rainfall.
Spacing:

Spacing: Space apple trees about 12–15 feet apart for standard varieties and 6–8 feet apart for dwarf varieties to allow adequate space for air circulation and growth.
"].to_json)
  puts "Updated conditions for Apple."
else
  puts "Apple plant not found. Please ensure it exists in the database."
end

# Rosemary
rosemary = Plant.find_by(common_name: "Rosemary")
if rosemary
  rosemary.update_column(:conditions, ["Climate & Temperature:

Ideal Temperature: Rosemary thrives in mild climates with temperatures between 60°F and 75°F (15°C to 24°C). It is hardy in USDA zones 7–10.
Hardiness: Rosemary is a Mediterranean plant and can tolerate mild frosts, but it’s not frost-hardy. In colder climates, it can be grown in containers and moved indoors during the winter.
Sunlight:

Full Sun: Rosemary needs at least 6–8 hours of direct sunlight each day to thrive. It prefers full sun exposure and warm conditions.
Soil:

Well-Drained Soil: Rosemary prefers sandy, well-drained soil with good aeration. It can tolerate slightly alkaline soils (pH 6.0–8.0), but it dislikes wet, waterlogged soil.
Soil Requirements: Sandy loam is ideal, but it will adapt to poor, rocky soils as long as they are not too acidic.
Watering:

Drought-Tolerant: Once established, rosemary is drought-tolerant and does not require frequent watering. Allow the soil to dry out between waterings to avoid root rot.
Watering Frequency: Water only when the soil is dry to the touch, especially in cooler months.
Spacing:

Spacing: Rosemary plants should be spaced 2–3 feet apart to allow for airflow and to prevent fungal diseases."].to_json)
  puts "Updated conditions for Rosemary."
else
  puts "Rosemary plant not found. Please ensure it exists in the database."
end

# Comfrey
comfrey = Plant.find_by(common_name: "Comfrey")
if comfrey
  comfrey.update_column(:conditions, ["Climate & Temperature:

Ideal Temperature: Comfrey grows best in moderate climates with temperatures ranging from 50°F to 75°F (10°C to 24°C). It is hardy in USDA zones 3–9.
Hardiness: Comfrey is frost-hardy and can survive winter in colder climates, but it dies back in winter and regenerates in spring.
Sunlight:

Full Sun to Partial Shade: Comfrey grows best in full sun but can tolerate partial shade. It will produce more leaves and flowers in full sunlight.
Soil:

Rich, Moist Soil: Comfrey thrives in fertile, moist, well-drained soil. It prefers slightly acidic to neutral pH (5.5–7.0).
Soil Requirements: Comfrey can grow in clay, loamy, or sandy soil but does best in rich, loamy soil with good drainage.
Watering:

Moderate to Regular Watering: Comfrey likes consistently moist soil, especially during the growing season. However, it does not tolerate waterlogging, so ensure good drainage.
Watering Frequency: Regular watering is recommended, especially in hot, dry weather.
Spacing:

Spacing: Comfrey should be spaced 18–24 inches apart to give it enough room to spread out."].to_json)
  puts "Updated conditions for Comfrey."
else
  puts "Comfrey plant not found. Please ensure it exists in the database."
end
