Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users
  resources :songs
  resources :playlists

  get '/showresult/:spotify_id' => 'songs#show_result', :as =>'show_result'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # get '/auth/spotify' => 'users#spotify'
  get '/auth/spotify/callback' => 'users#spotify'
end
