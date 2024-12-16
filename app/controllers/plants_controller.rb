class PlantsController < ApplicationController
  before_action :set_plant, only: [:show]

  def index
    @plants = apply_filters(Plant.all)

    respond_to do |format|
      format.html # Full-page response
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "plants-list",
          partial: "plants/plants_list",
          locals: { plants: @plants }
        )
      end
    end
  end

  def show
    puts "Rendering plant details for #{@plant.common_name}"  # Debugging line
  end

  private

  # app/controllers/plants_controller.rb
  def set_plant
    puts "Searching for plant with common_name: #{params[:common_name]}"  # Debugging line
    @plant = Plant.find_by_common_name(params[:common_name])  # Ensure correct param key
  
    if @plant.nil?
      puts "Plant not found"  # Debugging line
      redirect_to plants_path, alert: "Plant not found"
    else
      puts "Found plant: #{@plant.common_name}"  # Debugging line
    end
  end
 

  def apply_filters(plants)
    return plants unless params[:search].present?
    search_params.each do |filter, values|
      next if values.blank? || !plants.respond_to?("filter_by_#{filter}")
      plants = plants.public_send("filter_by_#{filter}", values)
    end
    plants
  end

  def search_params
    params.fetch(:search, {}).permit(plant_function: [], layers: [], zone: [])
  end
end
