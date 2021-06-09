Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cycle_routes, only: [:index, :show] do
    resources :attempts, only: [:create]
  end
  resources :attempts, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
