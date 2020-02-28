Rails.application.routes.draw do

  post '/users/create', to: 'users#create'
  get '/signup', to: 'users#new'
  get 'users/index', to: 'users#index'
  get 'users/:id', to: 'users#show'

  get '/about', to: 'pages#about'
  root 'pages#home'
  resources :users
end
