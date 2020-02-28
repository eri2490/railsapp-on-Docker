Rails.application.routes.draw do

  # post 'users', to: 'users#create'
  get '/signup', to: 'users#new'

  get 'about', to: 'pages#about'
  root 'pages#home'
  
  resources :users
end
