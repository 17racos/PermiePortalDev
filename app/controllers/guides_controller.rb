class GuidesController < InheritedResources::Base

  private

    def guide_params
      params.require(:guide).permit(:title, :body)
    end

end
