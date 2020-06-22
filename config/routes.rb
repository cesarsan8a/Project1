Rails.application.routes.draw do
  get 'session/new'
  get 'session/create'
  get 'session/destroy'
  root :to => 'pages#home'
  resources :users

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  # get '/auth/spotify' => 'users#spotify'
  get '/auth/spotify/callback' => 'users#spotify'
end
