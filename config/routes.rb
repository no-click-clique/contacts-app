Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/contacts" => 'contacts#index'
    post "/contacts" => 'contacts#create'
    get "/contacts/:id" => 'contacts#show'
    patch "/contacts/:id" => 'contacts#update'
    delete "/contacts/:id" => 'contacts#destroy'
  end
end
