# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'static_pages#home'

  resources :users
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :comments do
    resources :comment_reactions, only: [:new, :create, :index]
  end

  resources :comment_reactions do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :posts do
    resources :comments
  end
end
