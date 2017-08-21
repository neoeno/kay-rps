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
    move = params[:move]
    game = Game.new
    game_result = game.result
    if game_result == :player_win
      computer_move = game.what_loses_against_this(move.downcase.to_sym)
      "You chose #{move.capitalize}, computer chose #{computer_move.capitalize}, you win!"
    elsif game_result == :computer_win
      computer_move = game.what_wins_against_this(move.downcase.to_sym)
      "You chose #{move.capitalize}, computer chose #{computer_move.capitalize}, you lose!"
    else
      "You chose #{move.capitalize}, computer chose #{move.capitalize}, you draw!"
    end
  end

  run! if app_file == $0
end
