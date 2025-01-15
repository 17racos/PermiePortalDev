class PestsController < ApplicationController
  before_action :set_pest, only: :show

  def index
    @pests = Pest.all
  end

  def show
    @plants = @pest.plants
  end

  private

  # Set pest by slug
  def set_pest
    @pest = Pest.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to pests_path, alert: "Pest not found"
  end
end
