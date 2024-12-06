class PlantsController < ApplicationController
  before_action :set_plant, only: [:show]

  # GET /plants
  def index
    @plants = apply_filters(Plant.all)
  end

  # GET /plants/:id
  def show
    # @plant is set by the `set_plant` before_action
  end

  private

  # Finds the plant by its common_name from the parameterized URL
  def set_plant
    @plant = Plant.find_by_common_name(params[:id])
  end

  # Applies search filters to the plants
  def apply_filters(plants)
    return plants unless params[:search].present?

    search_params.each do |filter, values|
      next unless values.present? && plants.respond_to?("filter_by_#{filter}")
      plants = plants.public_send("filter_by_#{filter}", values)
    end

    plants
  end

  # Permits nested search parameters for filtering
  def search_params
    params.fetch(:search, {}).permit(functions: [], layers: [], zones: [])
  end
end
