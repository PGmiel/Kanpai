Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants do
    resources :bookings, only: [ :index, :new, :create ]
    resources :tables, only: [ :index, :new, :create ]
  end

  resources :tables do
    resources :orders, only: [ :index, :new, :create ]
  end

  resources :orders, only: [ :show, :edit, :update, :destroy ] do
    resources :order_items, only: [ :index, :new, :create ]
  end

  resources :menu_items
  resources :order_items
end
