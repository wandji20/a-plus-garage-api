Rails.application.routes.draw do
  post '/login',    to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'

  resources :users do
    resources :cars
  end
  resources :parts
  resources :categories
  resources :admins

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
