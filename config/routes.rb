Rails.application.routes.draw do
  
  post '/users', to: 'users#create'
  get '/users', to: 'users#index'
  get '/signup', to: 'users#new'
  get '/users/:id', to: 'users#show'

  get '/about', to: 'pages#about'
  root 'pages#home'
  resources :users
end
