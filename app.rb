require 'sinatra'

class RPS < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/sessions/new'
  end

  get '/sessions/new' do
    erb :new_session
  end

  post '/sessions' do
    session[:name] = params[:name]
    redirect '/game'
  end

  get '/game' do
    @name = session[:name]
    erb :game
  end

  post '/game' do
    if params[:move] == "Rock"
      "You win!"
    elsif params[:move] == "Paper"
      "You lose!"
    else
      "You draw!"
    end
  end
end
