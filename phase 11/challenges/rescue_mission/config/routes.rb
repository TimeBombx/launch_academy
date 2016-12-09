Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions

  post '/answers/new' => "answers#create"

  resources :users, only: [:show]
  resources :sessions, only: [:create, :destroy] # login users
end
