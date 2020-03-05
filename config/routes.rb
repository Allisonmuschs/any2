Rails.application.routes.draw do


  get 'library', to: 'pages#library'

  namespace :user do
    get 'profiles/profile'
  end
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :song_requests, except: [:destroy, :update]
  end

  resources :song_requests, only: [:destroy, :update]

  resources :song_requests do
   resources :comments, only: [:new, :create]
    member do
      patch 'solved'
    end

  end
  resources :comments do
    resources :comments, only: [:new, :create]
  end

  resources :comments, only: [:edit, :update, :destroy]




end
