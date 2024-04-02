Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check

  get "about", to: "pages#about"

  # Home resource routes
  resources :homes do
  # Nested route for new reservations under a specific home
    resources :reservations, only: [:new, :create]
  end

  # Reservation routes
  resources :reservations, only: [:show, :destroy, :edit, :update] do
    member do
      patch :accept
      patch :decline
    end
  end

  # # Notifications route for the current user
  # get '/users/notifications', to: 'users#index', as: 'user_notifications'
  resources :users, only: [:show]

  get "profile", to: "users#profile"
end
