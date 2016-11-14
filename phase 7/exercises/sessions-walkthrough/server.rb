require "sinatra"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

# YOUR CODE GOES HERE
use Rack::Session::Cookie, {
  secret: 'osjndfojdnfiow',
  expire_after: 86400
}

get '/' do
  erb :index
end

get '/reset' do
  session.clear
  redirect '/'
end

post '/create' do
  session[:username] = params[:username]
  session[:codeword] = params[:code_word]
  session[:message] = params[:message]
  binding.pry

  erb :index
end

post '/codeword' do
  if session[:codeword] == params[:entered_code_word]
    @message = session[:message]
    erb :message
  else
    erb :index
  end
end