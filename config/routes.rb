Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users do
    resources :trips, only: [:index, :show]
  end

  resources :trips, except: [:index, :show]

  resources :supplies

  post 'trips/results'

  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  root 'landing#index'
end
