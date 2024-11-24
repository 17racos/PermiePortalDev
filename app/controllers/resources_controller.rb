class ResourcesController < ApplicationController
  # Action for the Resources index page
  def index
    @resources = Resource.all
  end

  # Action for the "What is Permaculture?" page
  def whatisperm
    # You can add any logic you need here, like passing specific data to the view
    # For example:
    @perm_description = "Permaculture is a design philosophy that integrates ecology, agriculture, and social systems to create sustainable and self-sufficient environments."
  end
    # Action for the "Why Permaculture Matters" page
  def whyitmatters
    @why_description = "Permaculture matters because it addresses the global challenges of sustainability..."
  end
end


