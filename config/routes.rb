Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users do
    resources :trips, only: [:index, :show]
  end

  resources :trips, except: [:index, :show]

  resources :supplies

  put 'trip_supplies/:id/increase', to: "trip_supplies#increase", as: "trip_supplies_increase"
  put 'trip_supplies/:id/decrease', to: "trip_supplies#decrease", as: "trip_supplies_decrease"

  post 'trips/results'

  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  root 'landing#index'
end
