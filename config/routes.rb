Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :song_requests, except: [:destroy, :update]
  end

  resources :song_requests, only: [:destroy, :update]

  resources :song_requests do
   resources :comments, only: [:new, :create]
  end
  resources :comments do
    resources :comments, only: [:new, :create]
  end

end
