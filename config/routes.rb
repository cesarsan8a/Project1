Rails.application.routes.draw do

  root :to => 'pages#home'
  resources :users
  resources :songs
  resources :playlists

  get 'songs/showresult/:spotify_id' => 'songs#show_result', :as =>'show_result'
  post 'songs/showresult/:spotify_id' => 'songs#create'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # get '/auth/spotify' => 'users#spotify'
  get '/auth/spotify/:callback' => 'users#spotify'
  post '/auth/spotify/:callback/:id' => 'users#create'

end
