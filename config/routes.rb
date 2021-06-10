Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cycle_routes, only: [:index, :show] do
    resources :attempts, only: [:create]
    resources :reviews, only: [:create, :destroy]
  end
  resources :attempts, only: [:show]
  resources :users, only: [:show]
  get "add_friend", to: 'friendships#create'
  delete "delete_friend", to: 'friendships#destroy'
end
