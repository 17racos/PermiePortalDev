Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  # Resources routes
  resources :resources, only: [:index] do
    get 'whatisperm', on: :collection, as: :whatisperm  # Action for "What is Permaculture?"
    get 'whyitmatters', on: :collection, as: :whyitmatters  # Action for "Why Permaculture Matters?"
  end

  # Other custom routes
  get 'plants', to: 'plants#index'
  get 'community', to: 'community#index'
  get 'get_involved', to: 'get_involved#index'
end
