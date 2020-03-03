Rails.application.routes.draw do

  get 'posts/new'
  get 'posts/index'
  
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'
  root 'pages#home'

  resources :users
  resources :posts
end
