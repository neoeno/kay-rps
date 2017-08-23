require 'sinatra/base'
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
    game = Game.new
    @result = game.make_result(player_move)
    erb :result
  end

  helpers do
    def player_move
      params[:move].downcase.to_sym
    end
  end

  run! if app_file == $0
end
