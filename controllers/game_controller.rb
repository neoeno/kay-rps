require 'sinatra/base'
require_relative '../lib/game'

class GameController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  
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
end
