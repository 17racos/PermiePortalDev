class PlantsController < ApplicationController
  def index
    @plants = Plant.all
    @plants = apply_filters(@plants)
  end

  private

  def apply_filters(plants)
    if params[:search].present?
      plants = plants.filter_by_functions(params[:search][:functions]) if params[:search][:functions].present?
      plants = plants.filter_by_layers(params[:search][:layers]) if params[:search][:layers].present?
      plants = plants.filter_by_zones(params[:search][:zones]) if params[:search][:zones].present?
    end
    plants
  end
end
