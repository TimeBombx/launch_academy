require 'sinatra'
require "json"
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

helpers do
  def current_user
    if @current_user.nil? && session[:user_id]
      @current_user = User.find_by(id: session[:user_id])
      session[:user_id] = nil unless @current_user
    end
    @current_user
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetup/:id' do
  @meetup = Meetup.find(params['id'])
  erb :'meetups/show'
end

get "/meetup/:id/edit" do
  @meetup = Meetup.find(params['id'])
  erb :'meetups/edit'
end

get "/meetup/:id/delete" do
  meetup = Meetup.find(params['id'])
  user_meetups = UserMeetup.where(meetup_id: params['id'])
  user_meetups.destroy_all
  meetup.destroy
  redirect '/'
end

post "/meetup/:id/edit" do
  @meetup = Meetup.find(params['id'])
  valid_params = params
  valid_params.delete('splat')
  valid_params.delete('captures')

  if @meetup.update(valid_params)
    flash[:notice] = "Update successful"
    redirect "/meetup/#{@meetup.id}"
  else
    flash[:notice] = "Error updaing meetup please try again later"
    erb :'meetups/edit'
  end
end

post '/meetups' do
  meetup = Meetup.find(params['id'])

  if params['option'] == "Leave meetup"
    UserMeetup.where(meetup_id: meetup.id, user_id: session[:user_id]).destroy_all
    flash[:notice] = "You have left the meetup."
  else
    if meetup.users.where(id: session[:user_id]).count > 1
      flash[:notice] = "You are already apart of this meetup."
    else
      um = UserMeetup.create(meetup_id: meetup.id, user_id: session[:user_id])
      um.save!
      flash[:notice] = "You have joined the meetup."
    end
  end

  redirect "/meetup/#{meetup.id}"
end

get '/meetups/new' do
  erb :'meetups/new'
end

post '/meetups/new' do
  title = params['title']
  user_id = session[:user_id]
  description = params['description']
  location = params['location']

  meetup = Meetup.create(title: title, user_id: user_id, description: description, location: location)
  UserMeetup.create(meetup_id: meetup.id, user_id: session[:user_id])
  redirect "/meetup/#{meetup.id}"
end