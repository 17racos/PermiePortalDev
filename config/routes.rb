Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  get 'projects', to: 'projects#index'
  get 'plants', to: 'plants#index'
  get 'community', to: 'community#index'
  get 'get_involved', to: 'get_involved#index'
end

