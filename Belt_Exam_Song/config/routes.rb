Rails.application.routes.draw do

  root 'users#index'

  resources :users
  resources :songs
  resources :playlists

  get '/main' => 'users#new'
  post '/show' => 'users#show'

  delete 'songs/:id/delete' => 'songs#delete_song'
  delete '/sessions' => 'sessions#destroy'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'users#logout'

end
