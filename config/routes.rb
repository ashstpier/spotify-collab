Rails.application.routes.draw do

  root "pages#home"

  get '/auth/spotify/callback', to: 'pages#auth'

  resources :playlists
  resources :users
end
