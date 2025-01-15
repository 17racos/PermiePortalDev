class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  # GET /guides
  def index
    @guides = Guide.all
  end

  # GET /guides/:slug
  def show
    custom_view = Rails.root.join("app", "views", "guides", "#{@guide.slug}.html.erb")
  
    if File.exist?(custom_view)
      render template: "guides/#{@guide.slug}"
    else
      render :show
    end
  end

  private

  # Use friendly_id to find the guide by slug
  def set_guide
    @guide = Guide.friendly.find(params[:slug])
  rescue ActiveRecord::RecordNotFound
    redirect_to guides_path, alert: 'Guide not found.'
  end

  # Strong parameters for guide creation and updates
  def guide_params
    params.require(:guide).permit(:title, :body, :image, :slug)
  end
end
