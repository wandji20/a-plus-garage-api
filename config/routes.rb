Rails.application.routes.draw do
  resources :parts
  resources :categories
  resources :cars
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
