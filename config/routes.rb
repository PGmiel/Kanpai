Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :bookings, only: [ :index, :new, :create ]
    resources :tables, only: [ :index, :new, :create ]
    resources :reviews, only: [ :new, :create, :edit, :update, :show, :destroy]
    post "favoritize", to: "restaurants#favoritize"
  end

  resources :tables, only: [:show]
  resources :orders, only: [:view, :show, :update] do
    get "new_payment", to: "payments#new_payment"
    resources :order_items, only: [:create]
  end
  resources :order_items, only: [:destroy]

  get "bookings", to: "bookings#user_bookings"
  get 'dashboard', to: 'pages#dashboard'
  patch "validate_table_order/:order_id", to: "order_items#validate_order", as: :validate_order
  get "closing_table/:order_id", to: "orders#closing_table", as: :closing_table
  get "thank_you", to: "pages#thank_you"
  get "validate_user/:table_id", to: "tables#validate_user", as: :validate_user
  post "create_order/:table_id", to: "orders#create_order", as: :create_order
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
