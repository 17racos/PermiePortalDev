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
    Rails.logger.info "Rendering plant details for #{@plant.common_name}"
  end

  private

  # Set the plant based on the common_name parameter
  def set_plant
    Rails.logger.info "Searching for plant with common_name: #{params[:common_name]}"
    @plant = Plant.find_by_common_name(params[:common_name])

    unless @plant
      Rails.logger.warn "Plant not found: #{params[:common_name]}"
      redirect_to plants_path, alert: "Plant not found"
    else
      Rails.logger.info "Found plant: #{@plant.common_name}"
    end
  end

  # Dynamically apply filters to the plants query
  def apply_filters(plants)
    return plants unless params[:search].present?
  
    # Apply filters only if all criteria are present
    search_params.each do |filter, values|
      next if values.blank?
  
      filter_method = "filter_by_#{filter}"
      if plants.respond_to?(filter_method)
        plants = plants.public_send(filter_method, values)
      else
        Rails.logger.warn "Unknown filter: #{filter}"
      end
    end
  
    plants
  end

  # Permit and fetch the search parameters
  def search_params
    params.fetch(:search, {}).permit(plant_function: [], layers: [], zone: [])
  end
end
