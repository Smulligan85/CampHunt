Rails.application.routes.draw do
  devise_for :users
  post 'users/results'

  resources :trips

  authenticated :user do
    root 'users#show', :as => :authenticated_root
  end
  root 'landing#index'
end
