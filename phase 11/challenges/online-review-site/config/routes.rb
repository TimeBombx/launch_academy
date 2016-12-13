Rails.application.routes.draw do
  get '/', to: 'reviews#index'
  get '/user/login', to: 'sessions#new'
  post '/user/login', to: 'sessions#create'
  post '/user/signout', to: 'sessions#destroy'

  resources :items
  resources :reviews
  resources :users, except: [:destroy]
end