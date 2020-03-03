Rails.application.routes.draw do
  get 'song_requests/index'
  get 'song_requests/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :song_requests
  end
  resources :comments, only: [:new, :create]
end
