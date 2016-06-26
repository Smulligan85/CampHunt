Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :trips
  post 'trips/results'

  get '/auth/:twitter/callback', to: 'sessions#create'

  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  root 'landing#index'
end
