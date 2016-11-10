require "sinatra"
require 'pry'
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get '/teams' do
  @teams = Array.new
  TeamData::ROLL_CALL.each do |key, value|
    @teams << Team.new(key, value)
  end

  erb :teams
end

get '/teams/:team_name' do
  @team = Team.new(params[:team_name], TeamData::ROLL_CALL[:"#{params[:team_name]}"])
  binding.pry

  erb :team
end
