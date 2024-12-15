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
    # The @plant is already set by the before_action :set_plant
  end

  private
  
  def set_plant
    @plant = Plant.find_by("LOWER(common_name) = ?", params[:id].downcase)  # Ensure case-insensitive match
    redirect_to plants_path, alert: "Plant not found" if @plant.nil?
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
    params.fetch(:search, {}).permit(plant_function: [], layers: [], zones: [])
  end
end
