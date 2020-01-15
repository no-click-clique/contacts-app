Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/first_contact_url" => "contacts#first_contact_action"
    get "/all_contacts_url" => "contacts#all_contacts_action"
  end
end
