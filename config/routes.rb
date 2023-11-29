Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/auth/spotify/callback', to: 'users#spotify'
  resources :albums, only: [:index, :show]

  resources :playlists, only: [:index, :show, :new, :create] do
    resources :playlist_tracks, only: [:create]
  end

  resources :songs, only: [:show]

  resources :playlist_tracks, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
