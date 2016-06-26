Rails.application.routes.draw do
  devise_for :users

  resources :trips
  post 'trips/results'

  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  root 'landing#index'
end
