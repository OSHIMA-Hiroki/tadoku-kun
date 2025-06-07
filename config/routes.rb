Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route
  root "books#index"

  # Book search (must come before books resources to avoid conflicts)
  get "books/search" => "books#search", as: :search_books
  
  # Books resources
  resources :books, only: [:index, :show, :new, :create] do
    resources :reading_logs, only: [:create, :destroy]
  end
  
  # Reading logs
  resources :reading_logs, only: [:index]
  
  # Users (public profiles) - put this after devise routes to avoid conflicts
  resources :users, only: [:index, :show], constraints: { id: /\d+/ }
end
