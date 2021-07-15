Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :cars
      end
      resources :parts
      resources :categories
    end
  end
  resources :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
