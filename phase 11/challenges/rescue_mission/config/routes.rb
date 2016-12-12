Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions

  get '/', to: redirect('/questions')
  get '/signin', to: "users#signin"
  post '/answers/new', to: "answers#create"

  resources :users, only: [:show]
  resources :sessions, only: [:create, :destroy] # login users
end
