Rails.application.routes.draw do
  post '/login',    to: 'users#login'

  resources :users, only: [:create, :show] do
    resources :cars, only: [:create, :show, :update, :destroy] do
      resources :parts, only: [:create, :update, :show]
    end
  end

end
