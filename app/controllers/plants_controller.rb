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
    # @plant is already set by the before_action :set_plant
  end

  private

  def set_plant
    # Use the common_name directly, as per your controller's expected behavior
    @plant = Plant.find_by_common_name(params[:id])
    
    # If the plant is not found, redirect with an error message
    if @plant.nil?
      redirect_to plants_path, alert: "Plant not found"
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
