Rails.application.routes.draw do
  post '/login',    to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#logged_in?'

  resources :users only: [:create, :show] do
    resources :cars only: [:create, :show, :update, :destroy]
  end
  resources :parts only: [:index, :create, :update, :destroy]

  # resources :categories
  # resources :admins

end
