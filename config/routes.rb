Rails.application.routes.draw do

  root "pages#home"

  get '/auth/spotify/callback', to: 'users#show'

  resources :playlists
end
