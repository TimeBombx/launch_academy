require 'sinatra'
require 'sinatra/reloader'
require "sinatra/activerecord"
require_relative 'models/contact'
also_reload 'models/contact'

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  @contacts = Contact.all
  erb :index
end

get '/contacts/:id' do
  @contact = Contact.find_by_id(params['id'])
  erb :show
end