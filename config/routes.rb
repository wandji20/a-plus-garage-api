Rails.application.routes.draw do
  resources :cars
  resources :radiator_coolants
  resources :rear_lights
  resources :fuel_pumps
  resources :tyres
  resources :brakes
  resources :oil_filters
  resources :oils
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
