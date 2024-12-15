Rails.application.routes.draw do
  # Other routes
  get 'guides/vermicomposting', to: 'guides#vermicomposting', as: :vermicomposting
  get 'pages/vermicomposting'
  
  # Guides routes
  resources :guides

  # Devise routes for users
  devise_for :users
  
  # Root route
  root 'home#index'

  # Plant routes, using common_name as the URL param
  resources :plants, param: :common_name, only: [:index, :show]

  # Resources routes
  resources :resources, only: [:index] do
    get 'whatisperm', on: :collection, as: :whatisperm
    get 'whyitmatters', on: :collection, as: :whyitmatters
  end
  
  # Custom routes
  get 'community', to: 'community#index'
  get 'get_involved', to: 'get_involved#index'
end
