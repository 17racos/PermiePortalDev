class PlantsController < ApplicationController
  def index
    @plants = apply_filters(Plant.all)
  end

  private

  def apply_filters(plants)
    return plants unless params[:search].present?

    plants = plants.filter_by_functions(params[:search][:functions]) if params[:search][:functions].present?
    plants = plants.filter_by_layers(params[:search][:layers]) if params[:search][:layers].present?
    plants = plants.filter_by_zones(params[:search][:zones]) if params[:search][:zones].present?

    plants
  end

  def search_params
    params.fetch(:search, {}).permit(functions: [], layers: [], zones: [])
  end
end
