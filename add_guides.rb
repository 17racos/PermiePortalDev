# add_guides.rb
require_relative './config/environment'

def add_guides(guides)
  guides.each do |guide|
    # Use find_or_create_by to prevent duplicates
    Guide.find_or_create_by(title: guide[:title]) do |g|
      g.body = guide[:body]
      g.image = guide[:image]
    end
  end
  puts "#{guides.size} guides have been added or updated."
end

#Guides to add
guides = [
  {
    title: 'Vermicomposting',
    body: 'Discover the art of vermicomposting, a sustainable gardening technique that uses worms to turn organic waste into nutrient-rich compost. Vermicomposting helps reduce food waste, enriches your soil with essential nutrients, and supports eco-friendly gardening practices. This guide covers everything from choosing the right worms, like red wigglers, to setting up a worm bin and maintaining a thriving compost system. Perfect for beginners and seasoned gardeners, vermicomposting is an easy and effective way to create organic compost that boosts plant growth and improves soil health. Start your worm composting journey today and transform kitchen scraps into a valuable resource for your garden.',
    image: 'vermicompost.jpg'
  },
  {
    title: 'Plant Families',
    body: 'Unlock the secrets of plant families and discover how understanding botanical relationships can transform your gardening and permaculture practices. This guide explores the major plant families, their unique characteristics, and how they influence companion planting and crop rotation. Learn how grouping plants by family can improve soil health, optimize nutrient cycling, and reduce pests naturally. Whether you are planning a vegetable garden or creating a diverse permaculture system, this guide will help you harness the power of plant families for sustainable and efficient garden design. Perfect for gardeners and permaculture enthusiasts alike, start exploring plant relationships today!',
    image: 'plant_families.jpg'
  }
]

# Call the method to add guides
add_guides(guides)

