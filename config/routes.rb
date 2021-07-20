Rails.application.routes.draw do
  post '/login',    to: 'users#login'

  resources :users, only: [:create, :show] do
    resources :cars, only: [:create, :show, :update, :destroy]
  end
  resources :parts, only: [:index, :create, :update, :destroy]

end
