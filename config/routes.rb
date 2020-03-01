Rails.application.routes.draw do

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'about', to: 'pages#about'
  root 'pages#home'

  resources :users
end
