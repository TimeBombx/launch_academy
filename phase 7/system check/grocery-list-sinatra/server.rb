require 'sinatra'
require 'csv'
require "pry"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/' do
  redirect '/groceries'
end

get '/groceries' do
  @groceries = CSV.read('grocery_list.csv')
  erb :index
end

post '/groceries' do
  CSV.open("grocery_list.csv", "a") do |f|
    f.puts([params[:grocery], params[:quantity].to_i]) unless params[:grocery].empty?
  end

  redirect '/groceries'
end