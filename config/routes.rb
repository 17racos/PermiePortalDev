Rails.application.routes.draw do
  get 'guides/vermicomposting', to: 'guides#vermicomposting', as: :vermicomposting
  get 'pages/vermicomposting'
  resources :guides
  devise_for :users
  root 'home#index'
  

  # Resources routes
  resources :resources, only: [:index] do
    get 'whatisperm', on: :collection, as: :whatisperm  # Action for "What is Permaculture?"
    get 'whyitmatters', on: :collection, as: :whyitmatters  # Action for "Why Permaculture Matters?"
  end
  
  resources :plants, only: [:index, :show]

  # Other custom routes
  get 'plants', to: 'plants#index'
  get 'community', to: 'community#index'
  get 'get_involved', to: 'get_involved#index'
end

#Plant Routes
Rails.application.routes.draw do
  resources :guides
  resources :plants, only: [:index, :show]
end
