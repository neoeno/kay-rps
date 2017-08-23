require 'sinatra'
require_relative './lib/game'

class GameResult
  def initialize(result:, player_move:, computer_move:)
    @result = result
    @player_move = player_move
    @computer_move = computer_move
  end

  attr_reader :result, :player_move, :computer_move
end

class ResultFactory
  def make_result(move)
    move = move.downcase.to_sym
    game = Game.new
    result = game.result
    GameResult.new(
      result: result,
      player_move: move,
      computer_move: game.opposing_move(result, move)
    )
  end
end

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
    @result = ResultFactory.new.make_result(params[:move])
    erb :result
  end

  run! if app_file == $0
end
