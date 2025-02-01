# add_guides.rb
require_relative './config/environment'

def add_guides(guides)
  guides.each do |guide|
    # Use find_or_create_by to prevent duplicates
    Guide.find_or_create_by(title: guide[:title]) do |g|
      g.body = guide[:body]
      
      # Directly set the image_url column with the correct image path
      g.image_url = "/app/assets/images/#{guide[:image]}"
      
      # Save the guide with the image_url
      g.save!
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
    title: 'How to Make a Worm Bin',
    body: 'Creating a DIY worm bin is an easy and affordable way to start vermicomposting at home. A well-designed worm bin provides the perfect environment for red wigglers to thrive while efficiently breaking down food scraps into nutrient-rich compost. This guide walks you through selecting the right container, adding ventilation and drainage, and preparing bedding to keep your worms healthy and productive. Whether you are setting up a bin for an indoor or outdoor composting system, this step-by-step guide ensures success. Build your own worm bin today and take the first step toward sustainable waste reduction and organic soil enrichment!',
    image: 'how-to-make-a-worm-bin.jpg'
  },
  {
    title: 'Turmeric Informational',
    body: 'Turmeric (Curcuma longa), often called the "Golden Spice," is a powerful superfood known for its anti-inflammatory, antioxidant, and immune-boosting properties. This ancient root has been used for centuries in Ayurvedic and Traditional Chinese Medicine to promote health and well-being. The active compound, **curcumin**, is scientifically proven to support joint health, aid digestion, improve brain function, and help prevent chronic diseases such as heart disease, diabetes, and cancer. Turmeric is also a natural remedy for arthritis, skin conditions, and gut health. Learn how to maximize its benefits by combining it with black pepper for enhanced absorption and incorporating it into your diet through golden milk, turmeric tea, or curcumin supplements. Whether used as a culinary spice, herbal remedy, or skincare ingredient, turmeric remains a cornerstone of natural health and holistic wellness. Discover the science behind its healing potential, the best ways to consume it, and how to harness the power of this remarkable spice for optimal health and longevity.',
    image: 'turmeric-informational.jpg'
  },
  {
  title: 'Moringa Informational',
  body: 'Discover the incredible health benefits of Moringa oleifera, also known as the "Miracle Tree." This nutrient-dense superfood is packed with antioxidants, vitamins, and minerals that support immune function, heart health, brain function, and digestive well-being. Moringa is a powerful anti-inflammatory and detoxifying plant that aids in blood sugar regulation, skin rejuvenation, and energy boost. Learn how to incorporate moringa powder, leaves, seeds, and oil into your diet to maximize its medicinal and nutritional properties. Explore the sustainable benefits of moringa for soil restoration, carbon sequestration, and water purification. Whether you are looking for a natural supplement, a plant-based protein source, or a holistic approach to wellness, Moringa is the ultimate superfood for health and sustainability.',
  image: 'moringa-informational.jpg'
  },
  {
    title: 'Plant Families',
    body: 'Unlock the secrets of plant families and discover how understanding botanical relationships can transform your gardening and permaculture practices. This guide explores the major plant families, their unique characteristics, and how they influence companion planting and crop rotation. Learn how grouping plants by family can improve soil health, optimize nutrient cycling, and reduce pests naturally. Whether you are planning a vegetable garden or creating a diverse permaculture system, this guide will help you harness the power of plant families for sustainable and efficient garden design. Perfect for gardeners and permaculture enthusiasts alike, start exploring plant relationships today!',
    image: 'plant-families.jpg'
  }
]

# Call the method to add guides
add_guides(guides)



