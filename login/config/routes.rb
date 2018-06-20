Rails.application.routes.draw do
  root 'users#new' 

  get 'log_of_in' => 'sessions#new', as: 'new_login'
  post 'log_of_in'=> 'sessions#create', as: 'login'
  delete 'logout' => 'sessions#destroy', as: 'logout'

  resources :users
  resources :secrets
end
