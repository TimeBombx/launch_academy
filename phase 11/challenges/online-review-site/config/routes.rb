Rails.application.routes.draw do
  get '/', to: 'items#index'
  get '/user/login', to: 'sessions#new'
  post '/user/login', to: 'sessions#create'
  post '/user/signout', to: 'sessions#destroy'

  resources :items
  resources :reviews, only: [:new, :create]
  resources :users, except: [:destroy]
end