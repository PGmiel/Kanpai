Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :bookings, only: [ :index, :new, :create ]
    resources :tables, only: [ :index, :new, :create ]
  end

  resources :tables, only: [:show]
  resources :orders, only: [:view, :show] do
    resources :order_items, only: [:create]
  end

  get "bookings", to: "bookings#user_bookings"
  get 'dashboard', to: 'pages#dashboard'
end
