class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

  # GET /guides
  def index
    @guides = Guide.all
  end

  # GET /guides/:slug
  def show
    if @guide
      custom_view = Rails.root.join("app", "views", "guides", "#{@guide.slug}.html.erb")

      if File.exist?(custom_view)
        render template: "guides/#{@guide.slug}"
      else
        render :show
      end
    else
      redirect_to guides_path, alert: 'Guide not found.'
    end
  end

  private

  def set_guide
    @guide = Guide.friendly.find_by(slug: params[:slug])
    redirect_to guides_path, alert: 'Guide not found.' unless @guide
  end

  def guide_params
    params.require(:guide).permit(:title, :body, :image, :slug)
  end
end
