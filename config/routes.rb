Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :bookings, only: [ :index, :new, :create ]
    resources :tables, only: [ :index, :new, :create ]
  end

  resources :tables, only: [:show]
  resources :orders, only: [:view, :show]

  get "bookings", to: "bookings#user_bookings"
  get 'dashboard', to: 'pages#dashboard'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
