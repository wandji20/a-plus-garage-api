Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#create'
  post 'signup', to: 'users#create'

  resources :cars, only: [:create, :show, :update, :destroy, :index] do
    resources :parts, only: [:create, :update, :show]
  end

end
