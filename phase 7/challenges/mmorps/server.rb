require "sinatra"

set :bind, '0.0.0.0'  # bind to all interfaces

use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}

get '/' do
  @player_wins = session[:player_wins]
  @computer_wins = session[:computer_wins]
  @winner = session[:winner]

  erb :index
end

post '/reset' do
  session.clear
  redirect '/'
end

post '/choose' do
  @player_wins = session[:player_wins] || 0
  @computer_wins = session[:computer_wins] || 0

  players_choice = params[:choice]
  choices = %w(Rock Paper Scissors)
  computer_choice = rand(3)

  session[:flash_message] = "Player chose #{players_choice.downcase}, computer chose #{choices[computer_choice].downcase}. "
  if players_choice == choices[computer_choice]
    session[:flash_message] += "It was a tie"
  elsif players_choice == choices[computer_choice - 1]
    session[:flash_message] += "Computer scores."
    @computer_wins += 1
  else
    session[:flash_message] += "Player scores."
    @player_wins += 1
  end

  if @player_wins >= 3
    session[:winner] = "Player"
  elsif @computer_wins >= 3
    session[:winner] = "Computer"
  end

  session[:player_wins] = @player_wins
  session[:computer_wins] = @computer_wins
  redirect '/'
end