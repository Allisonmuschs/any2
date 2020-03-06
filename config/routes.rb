Rails.application.routes.draw do


  get 'library', to: 'pages#library'

  devise_for :users
  resources :users, only: [] do
    get 'profiles', to: "pages#profile"
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :song_requests, except: [:destroy, :update]
  end

  resources :song_requests do
    resources :favorites, only: [:create, :destroy]
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

  resources :comments do
    member do
      put 'like'
    end
  end

end
