# add_guide_page.rb
require 'fileutils'
require 'active_support/inflector' # Include ActiveSupport for `underscore` method

# Method to add a new page to the GuidesController
def add_guide_page(page_name)
  controller_path = "app/controllers/guides_controller.rb"
  view_path = "app/views/guides/#{page_name}.html.erb"
  routes_path = "config/routes.rb"

  # Add action to GuidesController
  if File.exist?(controller_path)
    controller_content = File.read(controller_path)
    unless controller_content.include?("def #{page_name}")
      File.open(controller_path, "a") do |file|
        file.puts("\n  def #{page_name}")
        file.puts("    # Add any logic here for #{page_name}")
        file.puts("  end\n")
      end
      puts "Added '#{page_name}' action to GuidesController."
    else
      puts "Action '#{page_name}' already exists in GuidesController."
    end
  else
    puts "GuidesController not found."
    return
  end

  # Create view file
  unless File.exist?(view_path)
    FileUtils.mkdir_p(File.dirname(view_path))
    File.open(view_path, "w") do |file|
      file.puts("<h1>#{page_name.capitalize} Guide</h1>")
      file.puts("<p>This is the #{page_name.capitalize} guide content.</p>")
    end
    puts "Created view: #{view_path}."
  else
    puts "View file for '#{page_name}' already exists."
  end

  # Add route to config/routes.rb
  if File.exist?(routes_path)
    routes_content = File.read(routes_path)
    route_line = "  get 'guides/#{page_name}', to: 'guides##{page_name}', as: :#{page_name}"
    unless routes_content.include?(route_line.strip)
      if routes_content.include?("Rails.application.routes.draw do")
        # Append the route inside the Rails.application.routes.draw block
        updated_content = routes_content.sub(
          /Rails\.application\.routes\.draw do/,
          "Rails.application.routes.draw do\n#{route_line}"
        )
        File.write(routes_path, updated_content)
        puts "Added route for '#{page_name}' to routes.rb."
      else
        puts "Could not find 'Rails.application.routes.draw do' block in routes.rb."
      end
    else
      puts "Route for '#{page_name}' already exists in routes.rb."
    end
  else
    puts "routes.rb file not found."
  end
end

# Example usage
if ARGV.size != 1
  puts "Usage: ruby add_guide_page.rb <page_name>"
  exit
end

page_name = ARGV[0].underscore # Use ActiveSupport's `underscore` method
add_guide_page(page_name)

