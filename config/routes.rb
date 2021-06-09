Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cycle_routes, only: [:index, :show] do
    resources :attempts, only: [:create]
  end
  resources :attempts, only: [:show]
  resources :users, only: [:show]
end
