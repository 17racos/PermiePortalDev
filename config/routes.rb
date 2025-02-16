Rails.application.routes.draw do
  # Suppress favicon errors
  get '/favicon.ico', to: proc { [204, {}, []] }

  # Devise routes for users
  devise_for :users

  # Root route
  root 'home#index'

  # Dynamic guides routes using slugs
  resources :guides, param: :slug

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

  # Pest routes
  resources :pests, param: :slug, only: [:index, :show]

  # ✅ Serve Static Images Locally (ONLY in Development)
  if Rails.env.development?
    get '/images/:filename', to: proc { |env|
      req = Rack::Request.new(env)
      filename = req.params['filename']
      
      # Ensure filename is present
      if filename.nil? || filename.empty?
        [400, { "Content-Type" => "text/plain" }, ["Bad Request: Missing filename"]]
      else
        file_path = Rails.root.join('public', 'images', filename)

        if File.exist?(file_path)
          [200, { "Content-Type" => Rack::Mime.mime_type(File.extname(file_path)) }, [File.binread(file_path)]]
        else
          [404, { "Content-Type" => "text/plain" }, ["Not Found"]]
        end
      end
    }, constraints: { filename: /.+\.(jpg|jpeg|png|gif|webp)/ }
  end
end
