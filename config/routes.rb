Rails.application.routes.draw do
  # Trips
  get "/trips" => "trips#index"
  get "/trips/:id" => "trips#show"
  post "/trips" => "trips#create"
  patch "/trips/:id" => "trips#update"
  delete "/trips/:id" => "trips#destroy"

  # Users
  get "/users" => "users#index"
  post "/users" => "users#create"
end
