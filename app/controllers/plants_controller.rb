class PlantsController < ApplicationController 
  before_action :set_plant, only: [:show]

  # GET /plants
  def index
    # Apply filters or display all plants
    @plants = apply_filters(Plant.all)

    respond_to do |format|
      format.html  # for regular HTML requests
      format.turbo_stream { render turbo_stream: turbo_stream.replace("plants-list", partial: "plants/plants_list", locals: { plants: @plants }) }  # for Turbo requests
    end
  end

  # GET /plants/:id
  def show
    # @plant is already set by the `set_plant` before_action
  end

  private

  def set_plant
    @plant = Plant.find(params[:id])  # Use id to find the plant
  end

  # Applies search filters to the plants
  def apply_filters(plants)
    return plants unless params[:search].present?

    search_params.each do |filter, values|
      next if values.blank? || !plants.respond_to?("filter_by_#{filter}")
      plants = plants.public_send("filter_by_#{filter}", values)
    end

    plants
  end

  # Permits nested search parameters for filtering
  def search_params
    params.fetch(:search, {}).permit(plant_function: [], layers: [], zones: [])
  end
end
