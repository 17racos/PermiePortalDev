class PlantsController < ApplicationController
  before_action :set_plant, only: [:show]

  # GET /plants
  def index
    @plants = Plant.all
    @plants = apply_filters(@plants) if params[:search].present?

    respond_to do |format|
      format.html # Render the full-page view
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "plants-list",
          partial: "plants/plants_list",
          locals: { plants: @plants }
        )
      end
    end
  end

  # GET /plants/:common_name
  def show
    Rails.logger.info "Rendering plant details for #{@plant.common_name}"
  end

  private

  # Find a plant by its parameterized common_name
  def set_plant
    parameterized_name = params[:common_name].tr('-', ' ') # Replace hyphens with spaces
    Rails.logger.info "Searching for plant with common_name: #{parameterized_name}"
    @plant = Plant.find_by_common_name(parameterized_name)

    unless @plant
      Rails.logger.warn "Plant not found: #{parameterized_name}"
      redirect_to plants_path, alert: "Plant not found."
    else
      Rails.logger.info "Found plant: #{@plant.common_name}"
    end
  end

  # Apply filters to the plants query
  def apply_filters(plants)
    search_params.each do |filter, values|
      next if values.blank?

      case filter.to_sym
      when :plant_function
        plants = plants.filter_by_plant_function(values)
      when :layers
        plants = plants.filter_by_layers(values)
      when :zone
        plants = plants.filter_by_zones(values.map(&:to_i))
      else
        Rails.logger.warn "Unknown filter: #{filter}"
      end
    end

    plants
  end

  # Safely fetch and permit search parameters
  def search_params
    params.fetch(:search, {}).permit(plant_function: [], layers: [], zone: [])
  end
end
