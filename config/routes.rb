Rails.application.routes.draw do
  namespace :user do
    get 'profiles/profile'
  end
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :song_requests
  end

  resources :song_requests do
   resources :comments, only: [:new, :create]
  end

  resources :comments do
    resources :comments, only: [:new, :create]
  end


end
