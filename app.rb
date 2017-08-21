require 'sinatra'
require_relative './lib/game'

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
    @player_move = params[:move].downcase.to_sym
    game = Game.new
    @result = game.result
    @computer_move = game.opposing_move(@result, @player_move)

    erb :result
  end

  run! if app_file == $0
end
