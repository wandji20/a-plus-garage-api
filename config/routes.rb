Rails.application.routes.draw do
  post '/login',    to: 'sessions#create'

  resources :users, only: [:create, :show] do
    resources :cars, only: [:create, :show, :update, :destroy]
  end
  resources :parts, only: [:index, :create, :update, :destroy]

  # resources :categories
  # resources :admins

end
