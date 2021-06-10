Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :bookings, only: [ :index, :new, :create ]
    resources :tables, only: [ :index, :new, :create ]
    resources :reviews, only: [ :new, :create, :edit, :update, :show, :destroy]
  end

  resources :tables, only: [:show]
  resources :orders, only: [:view, :show] do
    resources :order_items, only: [:create]
  end

  get "bookings", to: "bookings#user_bookings"
  get 'dashboard', to: 'pages#dashboard'
  get "validate_table_order/:order_id", to: "order_items#validate_order", as: :validate_order

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
