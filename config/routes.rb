Rails.application.routes.draw do
  # Suppress favicon errors
  get '/favicon.ico', to: proc { [204, {}, []] }

  # Dynamic guides routes using slugs
  resources :guides, param: :slug

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

  # Community and involvement pages
  get 'community', to: 'community#index'
  get 'get_involved', to: 'get_involved#index'

  resources :pests, param: :slug, only: [:index, :show]


end
